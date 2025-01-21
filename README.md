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
Use `winget` and `scoop` to install two sets of tools:
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

## **How to Use**
1. Clone this repository:
   ```bash
   git clone https://github.com/journeyman33/win10-wsl-ubuntu-setup.git
   cd win10-wsl-ubuntu-setup
   ```

2. Follow the steps in the respective directories:
   - **`scripts/windows`**: Run scripts to set up Windows applications.
   - **`scripts/ubuntu`**: Run scripts to configure WSL Ubuntu with `Devbox`.
   - **`dotfiles`**: Use GNU Stow to link configuration files.

## **Features**
- Step-by-step instructions for new users.
- Scripts for automating installations and configurations.
- Reproducible environments with Devbox and Nix.
- Centralized dotfile management with Stow.

## **Next Steps**
- Add initial scripts for `winget` and `scoop` in the `scripts/windows` directory.
- Write Devbox setup scripts for global tools in `scripts/ubuntu`.
- Populate the `dotfiles` directory with configurations from your current setup.

## **Contributing**
Feel free to fork this repository and submit pull requests for improvements or additional features.

