# dynamic winget.nu
# Dynamically generate a Winget installation script using Gum for interactive selection.

# Define a list of GUI applications with descriptions
let apps = [
    { name: "Docker Desktop", id: "Docker.DockerDesktop", description: "Container management tool." },
    { name: "Google Chrome", id: "Google.Chrome", description: "Web browser for fast and secure browsing." },
    { name: "VSCode", id: "Microsoft.VisualStudioCode", description: "Code editor for development." },
    { name: "PowerShell 7", id: "Microsoft.PowerShell", description: "Cross-platform shell and scripting language." },
    { name: "Windows Terminal", id: "Microsoft.WindowsTerminal", description: "Modern terminal application for Windows." },
    { name: "Cursor IDE", id: "Cursor.Cursor", description: "AI-powered code editor." },
    { name: "Notion", id: "Notion.Notion", description: "All-in-one productivity tool." },
    { name: "Ubuntu", id: "Canonical.Ubuntu", description: "Linux distribution for WSL." }
]

# Convert structured data to a Gum-compatible format
let options = ($apps | each { |app| $"($app.name): ($app.description)" } | str join "\n")

# Use Gum to allow interactive selection
let selected = ($options | gum choose --no-limit)

# Filter the selected applications based on the user input
let selected_apps = ($apps | where name in $selected)

# Generate Winget installation commands
let script = ($selected_apps | each { |app| $"winget install --id ($app.id) --silent --accept-source-agreements --accept-package-agreements" } | str join "\n")

# Save the generated script to a file
let script_path = "./generated-winget-install.ps1"
open $script_path --raw --write $script

# Print the generated script path
print $"Generated script saved to ($script_path)"

# Optionally execute the generated script
if (gum confirm --prompt "Run the generated script?") {
    shell $script_path
}

