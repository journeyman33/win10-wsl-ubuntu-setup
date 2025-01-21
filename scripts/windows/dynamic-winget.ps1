# dynamic-winget.ps1
# Use Gum to dynamically select and install winget packages.

# List of GUI applications with descriptions
$apps = @(
    @{ Name = "Docker Desktop"; Id = "Docker.DockerDesktop"; Description = "Container management tool." },
    @{ Name = "Google Chrome"; Id = "Google.Chrome"; Description = "Web browser for fast and secure browsing." },
    @{ Name = "VSCode"; Id = "Microsoft.VisualStudioCode"; Description = "Code editor for development." },
    @{ Name = "PowerShell 7"; Id = "Microsoft.PowerShell"; Description = "Cross-platform shell and scripting language." },
    @{ Name = "Windows Terminal"; Id = "Microsoft.WindowsTerminal"; Description = "Modern terminal application for Windows." },
    @{ Name = "Cursor IDE"; Id = "Cursor.Cursor"; Description = "AI-powered code editor." },
    @{ Name = "Notion"; Id = "Notion.Notion"; Description = "All-in-one productivity tool." },
    @{ Name = "Ubuntu"; Id = "Canonical.Ubuntu"; Description = "Linux distribution for WSL." }
)

# Prepare Gum input string
$options = $apps | ForEach-Object { "$($_.Name): $($_.Description)" } -join "`n"

# Interactive selection using Gum
$selected = gum choose --no-limit <<< $options

# Generate winget commands for selected apps
$script = ""
foreach ($app in $apps) {
    if ($selected -match [regex]::Escape($app.Name)) {
        $script += "winget install --id $($app.Id) --silent --accept-source-agreements --accept-package-agreements`n"
    }
}

# Save the script
$scriptPath = "$PSScriptRoot/generated-winget-install.ps1"
$script | Out-File -Encoding utf8 $scriptPath
Write-Host "Generated script saved to $scriptPath"

# Optionally execute the script
if ((Read-Host "Run the generated script? (y/n)").ToLower() -eq "y") {
    & $scriptPath
}
