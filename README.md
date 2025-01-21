# Windows 10 WSL Ubuntu Setup

This repository provides a comprehensive guide and necessary scripts to set up a new Windows 10 laptop with Windows Subsystem for Linux (WSL) running Ubuntu. It is designed to simplify the process for new users and serve as a personal reference for repeatable setups.

## **Purpose**
This repository aims to:
- Automate the installation of essential tools and applications on both Windows and WSL Ubuntu.
- Provide scripts and instructions to ensure a consistent development environment.
- Serve as a reference for managing dotfiles and configurations with GNU Stow.

## **Setup Overview**
The setup process is divided into three main steps:

### 1. **Windows Applications**
Use `winget` and `scoop` to install two sets of tools dynamically using the Gum utility from Charmbracelet. The user will interactively select packages from a curated list that includes descriptions of each application.
- **GUI Applications**: Installed with `winget` (e.g., Docker Desktop, VSCode, Google Chrome, etc.).
- **CLI Tools**: Installed with `scoop` (e.g., Neovim, Starship, Nushell, etc.).

### 2. **WSL Ubuntu Global Environment**
Use `Devbox` to:
- Install system-wide tools and applications globally (e.g., eza, zoxide, starship, and others).
- Maintain isolation and reproducibility for tools and dependencies.

### 3. **Dotfiles Management with Stow**
- Organize and version control configuration files (e.g., `.zshrc`, `starship.toml`, etc.).
- Use GNU Stow to symlink these files for easy replication across setups.

## **Repository Structure**
The repository is organized as follows:

```plaintext
win10-wsl-ubuntu-setup/
|
├── scripts/
│   ├── windows/       # Scripts for installing Windows applications (winget/scoop).
│   │   ├── dynamic-winget.ps1   # Interactive winget installer using Gum.
│   │   ├── dynamic-scoop.ps1    # Interactive scoop installer using Gum.
│   ├── ubuntu/        # Scripts for setting up WSL Ubuntu tools and environment.
│
├── dotfiles/          # Directory for managing configuration files with Stow.
│   ├── zsh/
│   ├── nvim/
│   ├── starship/
│   ├── ...
│
└── README.md          # Main documentation for the repository.
```

## **Prerequisites**
To run the installation scripts, ensure the following prerequisites are met:

### **Windows Environment**
1. **PowerShell Installed**:
   - Preferred: PowerShell 7 or higher (cross-platform version).
   - Minimum: Windows PowerShell (built into Windows 10).

2. **Winget Installed**:
   - Winget (Windows Package Manager) must be available. It comes pre-installed on modern Windows 10 versions.
   - To verify:
     ```powershell
     winget --version
     ```
   - If not installed, download it from the [official Winget repository](https://github.com/microsoft/winget-cli).

3. **Scoop Installed**:
   - Scoop is required for the CLI tools script. If it’s not installed, the script will automatically install it.
   - To verify:
     ```powershell
     scoop --version
     ```
   - If not installed, run:
     ```powershell
     iwr -useb get.scoop.sh | iex
     ```

4. **Charmbracelet Gum Installed**:
   - Required for interactive package selection.
   - Install using Scoop:
     ```powershell
     scoop install gum
     ```

### **WSL Environment**
1. **WSL Installed**:
   - Windows Subsystem for Linux (WSL) must be enabled and set up.
   - Preferred: WSL 2 with Ubuntu.
   - Verify installation:
     ```powershell
     wsl --list --verbose
     ```

2. **Ubuntu Installed via WSL**:
   - Ensure the Ubuntu distribution is installed.
   - To install:
     ```powershell
     winget install Canonical.Ubuntu
     ```

3. **Path Accessibility**:
   - Windows PowerShell must correctly access paths within the WSL environment if needed for WSL-based configurations.

---

## **How to Use**
1. Clone this repository:
   ```bash
   git clone https://github.com/journeyman33/win10-wsl-ubuntu-setup.git
   cd win10-wsl-ubuntu-setup
   ```

2. Follow the steps in the respective directories:
   - **`scripts/windows`**: Run `dynamic-winget.ps1` and `dynamic-scoop.ps1` to interactively install Windows applications.
   - **`scripts/ubuntu`**: Run scripts to configure WSL Ubuntu with `Devbox`.
   - **`dotfiles`**: Use GNU Stow to link configuration files.

## **Features**
- Step-by-step instructions for new users.
- Dynamic package selection for Windows tools using Gum.
- Scripts for automating installations and configurations.
- Reproducible environments with Devbox and Nix.
- Centralized dotfile management with Stow.

## **Next Steps**
- Test the `dynamic-winget.ps1` and `dynamic-scoop.ps1` scripts to ensure seamless interaction and installation.
- Add Devbox setup scripts for global tools in `scripts/ubuntu`.
- Populate the `dotfiles` directory with configurations from your current setup.

## **Contributing**
Feel free to fork this repository and submit pull requests for improvements or additional features.

