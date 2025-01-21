# dynamic-winget.ps1
# Dynamically generate a Winget installation script using Gum for interactive selection.

# Define a list of GUI applications with descriptions
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

# Build the selection string for Gum
$options = ($apps | ForEach-Object { "$($_.Name): $($_.Description)" }) -join "`n"

# Use Gum to allow interactive selection
$selected = $options | gum choose --no-limit --cursor.foreground "cyan" --item.foreground "white" --selected.foreground "green" --selected.background "black"

# Generate Winget commands for selected apps
$script = ""
foreach ($app in $apps) {
    if ($selected -match [regex]::Escape($app.Name)) {
        $script += "winget install --id $($app.Id) --silent --accept-source-agreements --accept-package-agreements`n"
    }
}

# Save the generated installation script
$scriptPath = "$PSScriptRoot/generated-winget-install.ps1"
$script | Out-File -Encoding utf8 $scriptPath
Write-Host "Generated script saved to $scriptPath"

# Optionally execute the generated script
if ((Read-Host "Run the generated script? (y/n)").ToLower() -eq "y") {
    & $scriptPath
}

