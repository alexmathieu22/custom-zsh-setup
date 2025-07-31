# Alex's Personal macOS Shell Setup

A comprehensive, automated setup script for configuring a modern, powerful terminal environment on macOS. This is my personal shell configuration that includes iTerm2, Oh My Zsh, Powerlevel10k theme, essential zsh plugins, and productivity tools.

## 📝 Notes

- This is a **personal configuration** optimized for my workflow
- The setup is **opinionated** and includes my preferred tools and settings
- Feel free to fork and customize for your own needs
- The script is **idempotent** - safe to run multiple times

## 🚀 What This Setup Includes

### Core Components

- **[iTerm2](https://iterm2.com/)** - Advanced terminal emulator for macOS
- **[Homebrew](https://brew.sh/)** - Package manager for macOS
- **[Oh My Zsh](https://ohmyz.sh/)** - Framework for managing zsh configuration
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - Fast, flexible zsh theme
- **[Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono)** - Monospace font optimized for coding

### Productivity Tools

- **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)** - Fish-like autosuggestions for zsh
- **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)** - Real-time syntax highlighting
- **[fzf](https://github.com/junegunn/fzf)** - Command-line fuzzy finder

### Custom Configuration

- **Custom iTerm2 Profile** - Pre-configured color scheme and settings
- **Personal .zshrc** - Optimized shell configuration with aliases and environment variables
- **Development Tools Integration** - ASDF, Azure CLI, PostgreSQL tools

## 📋 Prerequisites

- **macOS** (tested on macOS Monterey and later)
- **Internet connection** for downloading packages
- **Administrative privileges** for installing software

## 🛠️ Installation

1. **Clone or download this repository:**

   ```bash
   git clone <repository-url>
   cd iterm_setup
   ```

2. **Run the setup script:**

   ```bash
   ./setup.sh
   ```

3. **Follow the prompts:**
   - The script will automatically install all dependencies
   - Import the iTerm2 profile manually when prompted
   - Powerlevel10k will run its configuration wizard on first use

## 📁 Project Structure

```
iterm_setup/
├── setup.sh                    # Main installation script
├── alex.zshrc                  # Custom zsh configuration
├── alex-iterm2-custom.json     # Custom iTerm2 profile
├── README.md                   # This file
└── font/
    └── Roboto_Mono/           # Font files
        ├── *.ttf              # Variable weight fonts
        └── static/            # Static weight fonts
            └── *.ttf
```

## ⚙️ What the Script Does

### 1. System Setup

- Installs Homebrew (if not present)
- Updates Homebrew packages
- Installs iTerm2 via Homebrew cask

### 2. Font Installation

- Installs all Roboto Mono font variants
- Copies fonts to `~/Library/Fonts/`
- Handles duplicate detection

### 3. Shell Enhancement

- Installs Oh My Zsh framework
- Installs zsh-autosuggestions via Homebrew
- Installs zsh-syntax-highlighting via Homebrew
- Installs and configures fzf fuzzy finder

### 4. Configuration

- Backs up existing `.zshrc` (if present)
- Installs custom `.zshrc` configuration
- Provides instructions for iTerm2 profile import

## 🎨 iTerm2 Profile Features

The custom iTerm2 profile includes:

- **Roboto Mono Medium 16pt** font
- **Custom color scheme** optimized for coding
- **Transparency and blur effects** for modern aesthetics
- **Optimized key bindings** for productivity
- **Custom cursor and selection colors**

### Importing the Profile

1. Open iTerm2
2. Go to **iTerm2 > Preferences** (⌘,)
3. Navigate to **Profiles** tab
4. Click **Other Actions...** (gear icon)
5. Select **Import JSON Profiles...**
6. Choose `alex-iterm2-custom.json`
7. Set **Custom - Alex** as your default profile

## 🔧 Zsh Configuration Features

### Theme

- **Powerlevel10k** - Fast, customizable prompt
- First-time configuration wizard
- Git integration and status indicators

### Plugins & Tools

```bash
# Autosuggestions based on history
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting for commands
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Fuzzy finder integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

### Development Tools

- **ASDF** version manager for multiple languages
- **Azure CLI** integration
- **PostgreSQL** tools in PATH
- **GPG** configuration for signing commits

### Aliases

```bash
alias c='code'      # Open VS Code
alias tf='terraform' # Terraform shortcut
```

## 🔍 Key Bindings & Features

### fzf Integration

- **Ctrl+R** - Fuzzy search command history
- **Alt+C** - Fuzzy directory navigation
- **command **<Tab>\*\* - Fuzzy file completion

### zsh-autosuggestions

- **→ (Right Arrow)** - Accept suggestion
- **Ctrl+F** - Accept suggestion
- **Alt+F** - Accept next word

## 🎯 Compatible Systems

- **macOS Monterey (12.0)+**
- **Intel and Apple Silicon Macs**
- **zsh shell** (default on modern macOS)

---

**Happy coding!** 🚀
