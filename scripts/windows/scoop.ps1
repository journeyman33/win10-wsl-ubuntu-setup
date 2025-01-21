# dynamic-scoop.ps1
# Use Gum to dynamically select and install scoop packages.

# List of CLI tools with descriptions
$tools = @(
    @{ Name = "neovim"; Description = "Extensible code editor." },
    @{ Name = "helix"; Description = "Modern text editor written in Rust." },
    @{ Name = "nushell"; Description = "A modern shell." },
    @{ Name = "starship"; Description = "Cross-shell prompt." },
    @{ Name = "yazi"; Description = "Fast and modern file manager." },
    @{ Name = "git"; Description = "Version control system." },
    @{ Name = "gh"; Description = "GitHub CLI." },
    @{ Name = "fnm"; Description = "Node.js version manager." },
    @{ Name = "7zip"; Description = "File archiver." },
    @{ Name = "gum"; Description = "Utility for building interactive CLI apps." }
)

# Prepare Gum input string
$options = $tools | ForEach-Object { "$($_.Name): $($_.Description)" } -join "`n"

# Interactive selection using Gum
$selected = gum choose --no-limit <<< $options

# Generate scoop commands for selected tools
$script = ""
foreach ($tool in $tools) {
    if ($selected -match [regex]::Escape($tool.Name)) {
        $script += "scoop install $($tool.Name)`n"
    }
}

# Save the script
$scriptPath = "$PSScriptRoot/generated-scoop-install.ps1"
$script | Out-File -Encoding utf8 $scriptPath
Write-Host "Generated script saved to $scriptPath"

# Optionally execute the script
if ((Read-Host "Run the generated script? (y/n)").ToLower() -eq "y") {
    & $scriptPath
}
