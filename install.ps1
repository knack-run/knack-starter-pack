# Knack Starter Pack: installer (Windows PowerShell)
#
# Usage:
#   .\install.ps1
#
# Honours $env:CLAUDE_CONFIG_DIR if set; otherwise pins to $env:USERPROFILE\.claude
# (matches Claude Code's own resolution; avoids OneDrive Known Folder / Git-for-Windows
# / group policy drift that affects $HOME).
# Idempotent: re-running is a clean overwrite, not a duplicate install.
# Free pack: no licence key, no prompts.

$ErrorActionPreference = "Stop"

$PackId = "knack-starter-pack"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- Read pack version from PACK.yaml (single source of truth) ---

$PackYamlPath = Join-Path $ScriptDir "PACK.yaml"
if (-not (Test-Path $PackYamlPath)) {
    Write-Error "Could not find $PackYamlPath. Re-extract the pack zip and try again."
    exit 1
}
$VersionMatch = (Get-Content $PackYamlPath | Select-String -Pattern '^\s*version:\s*(.+)\s*$' | Select-Object -First 1)
if (-not $VersionMatch) {
    Write-Error "Could not read 'version:' from $PackYamlPath. Pack zip may be corrupted."
    exit 1
}
$PackVersion = $VersionMatch.Matches[0].Groups[1].Value.Trim()

# --- Resolve install root: $env:CLAUDE_CONFIG_DIR > $env:USERPROFILE\.claude ---

$ClaudeConfigDir = if ($env:CLAUDE_CONFIG_DIR) {
    $env:CLAUDE_CONFIG_DIR
} else {
    Join-Path $env:USERPROFILE ".claude"
}

Write-Host "Installing $PackId v$PackVersion"
Write-Host "  install root: $ClaudeConfigDir"

# --- Ensure target directories exist ---

$Targets = @("skills", "commands", "agents")
foreach ($t in $Targets) {
    New-Item -ItemType Directory -Force -Path (Join-Path $ClaudeConfigDir $t) | Out-Null
}

# --- Copy skills (one directory per skill) ---

$SkillsSrc = Join-Path $ScriptDir "skills"
if (Test-Path $SkillsSrc) {
    Get-ChildItem -Directory -Path $SkillsSrc | ForEach-Object {
        $dest = Join-Path $ClaudeConfigDir "skills\$($_.Name)"
        if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
        Copy-Item -Recurse -Force $_.FullName $dest
        Write-Host "  - skills/$($_.Name)"
    }
}

# --- Copy commands (flat .md files) ---

$CommandsSrc = Join-Path $ScriptDir "commands"
if (Test-Path $CommandsSrc) {
    Get-ChildItem -File -Path $CommandsSrc -Filter "*.md" | ForEach-Object {
        Copy-Item -Force $_.FullName (Join-Path $ClaudeConfigDir "commands\")
        Write-Host "  - commands/$($_.Name)"
    }
}

# --- Copy agents (flat .md files) ---

$AgentsSrc = Join-Path $ScriptDir "agents"
if (Test-Path $AgentsSrc) {
    Get-ChildItem -File -Path $AgentsSrc -Filter "*.md" | ForEach-Object {
        Copy-Item -Force $_.FullName (Join-Path $ClaudeConfigDir "agents\")
        Write-Host "  - agents/$($_.Name)"
    }
}

Write-Host ""
Write-Host "Done. Restart Claude Code to load the new skills."
Write-Host "Questions or feedback: hello@knack.run"
