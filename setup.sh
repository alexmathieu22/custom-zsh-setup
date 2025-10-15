#!/bin/bash

# iTerm2 Installation Script
# This script installs iTerm2 using Homebrew if it's not already installed

set -e  # Exit on any error

echo "🚀 Starting iTerm2 setup..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if Homebrew is installed
check_homebrew() {
    if ! command_exists brew; then
        echo "❌ Homebrew is not installed. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for the current session
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            # Apple Silicon Mac
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            # Intel Mac
            eval "$(/usr/local/bin/brew shellenv)"
        fi
        
        echo "✅ Homebrew installed successfully!"
    else
        echo "✅ Homebrew is already installed"
    fi
}

# Function to check if iTerm2 is installed
check_iterm2() {
    if [[ -d "/Applications/iTerm.app" ]]; then
        echo "✅ iTerm2 is already installed"
        return 0
    else
        echo "❌ iTerm2 is not installed"
        return 1
    fi
}

# Function to install Roboto Mono font
install_roboto_mono() {
    echo "🔤 Installing Roboto Mono font..."
    
    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    FONT_DIR="$SCRIPT_DIR/font/Roboto_Mono"
    
    if [[ ! -d "$FONT_DIR" ]]; then
        echo "❌ Roboto Mono font directory not found at $FONT_DIR"
        return 1
    fi
    
    # Create user fonts directory if it doesn't exist
    USER_FONTS_DIR="$HOME/Library/Fonts"
    mkdir -p "$USER_FONTS_DIR"
    
    # Install all TTF files
    INSTALLED_COUNT=0
    for font_file in "$FONT_DIR"/*.ttf "$FONT_DIR"/static/*.ttf; do
        if [[ -f "$font_file" ]]; then
            font_name=$(basename "$font_file")
            if [[ ! -f "$USER_FONTS_DIR/$font_name" ]]; then
                cp "$font_file" "$USER_FONTS_DIR/"
                echo "  ✅ Installed: $font_name"
                ((INSTALLED_COUNT++))
            else
                echo "  ⏭️  Already installed: $font_name"
            fi
        fi
    done
    
    if [[ $INSTALLED_COUNT -gt 0 ]]; then
        echo "✅ Roboto Mono font installation completed! ($INSTALLED_COUNT fonts installed)"
        echo "  💡 You may need to restart applications to see the new fonts"
    else
        echo "✅ All Roboto Mono fonts are already installed"
    fi
}

# Function to install iTerm2
install_iterm2() {
    echo "📦 Installing iTerm2 with Homebrew..."
    brew install --cask iterm2
    
    if [[ -d "/Applications/iTerm.app" ]]; then
        echo "✅ iTerm2 installed successfully!"
    else
        echo "❌ iTerm2 installation failed"
        exit 1
    fi
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
    echo "🔧 Installing Oh My Zsh..."
    
    # Check if Oh My Zsh is installed
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo "❌ Oh My Zsh is not installed. Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        
        if [[ -d "$HOME/.oh-my-zsh" ]]; then
            echo "✅ Oh My Zsh installed successfully!"
        else
            echo "❌ Oh My Zsh installation failed"
            return 1
        fi
    else
        echo "✅ Oh My Zsh is already installed"
    fi
}

# Function to install Powerlevel10k
install_powerlevel10k() {
    echo "⚡ Installing Powerlevel10k theme..."
    
    # Check if Powerlevel10k is already installed via Homebrew
    if brew list powerlevel10k &>/dev/null; then
        echo "✅ Powerlevel10k is already installed"
    else
        echo "📦 Installing Powerlevel10k with Homebrew..."
        brew install powerlevel10k
        
        if brew list powerlevel10k &>/dev/null; then
            echo "✅ Powerlevel10k installed successfully!"
        else
            echo "❌ Powerlevel10k installation failed"
            return 1
        fi
    fi
}

# Function to install zsh-autosuggestions
install_zsh_autosuggestions() {
    echo "🔧 Installing zsh-autosuggestions..."
    
    # Check if zsh-autosuggestions is already installed via Homebrew
    if brew list zsh-autosuggestions &>/dev/null; then
        echo "✅ zsh-autosuggestions is already installed"
    else
        echo "� Installing zsh-autosuggestions with Homebrew..."
        brew install zsh-autosuggestions
        
        if brew list zsh-autosuggestions &>/dev/null; then
            echo "✅ zsh-autosuggestions installed successfully!"
        else
            echo "❌ zsh-autosuggestions installation failed"
            return 1
        fi
    fi
}

# Function to install zsh-syntax-highlighting
install_zsh_syntax_highlighting() {
    echo "🎨 Installing zsh-syntax-highlighting..."
    
    # Check if zsh-syntax-highlighting is already installed via Homebrew
    if brew list zsh-syntax-highlighting &>/dev/null; then
        echo "✅ zsh-syntax-highlighting is already installed"
    else
        echo "📦 Installing zsh-syntax-highlighting with Homebrew..."
        brew install zsh-syntax-highlighting
        
        if brew list zsh-syntax-highlighting &>/dev/null; then
            echo "✅ zsh-syntax-highlighting installed successfully!"
        else
            echo "❌ zsh-syntax-highlighting installation failed"
            return 1
        fi
    fi
}

# Function to install fzf
install_fzf() {
    echo "🔍 Installing fzf (fuzzy finder)..."
    
    # Check if fzf is already installed via Homebrew
    if brew list fzf &>/dev/null; then
        echo "✅ fzf is already installed"
    else
        echo "📦 Installing fzf with Homebrew..."
        brew install fzf
        
        if brew list fzf &>/dev/null; then
            echo "✅ fzf installed successfully!"
        else
            echo "❌ fzf installation failed"
            return 1
        fi
    fi
    
    # Run fzf install script to set up key bindings and shell integration
    FZF_INSTALL_SCRIPT="$(brew --prefix)/opt/fzf/install"
    if [[ -f "$FZF_INSTALL_SCRIPT" ]]; then
        echo "⚙️  Setting up fzf key bindings and shell integration..."
        # Run the install script with --all to enable all features automatically
        echo "y" | "$FZF_INSTALL_SCRIPT" --all
        
        if [[ $? -eq 0 ]]; then
            echo "✅ fzf shell integration configured successfully!"
        else
            echo "❌ fzf shell integration setup failed"
            return 1
        fi
    else
        echo "❌ fzf install script not found at $FZF_INSTALL_SCRIPT"
        return 1
    fi
}

install_neovim() {
    echo "📝 Installing Neovim..."
    # Check if neovim is already installed via Homebrew
    if brew list neovim &>/dev/null; then
        echo "✅ Neovim is already installed"
    else
        echo "📦 Installing Neovim with Homebrew..."
        brew install neovim
        if brew list neovim &>/dev/null; then
            echo "✅ Neovim installed successfully!"
        else
            echo "❌ Neovim installation failed"
            return 1
        fi
    fi
}

# Function to import custom iTerm2 profile
import_iterm2_profile() {
    echo "🎨 Setting up custom iTerm2 profile..."
    
    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROFILE_FILE="$SCRIPT_DIR/alex-iterm2-custom.json"
    
    if [[ ! -f "$PROFILE_FILE" ]]; then
        echo "❌ Custom profile file not found at $PROFILE_FILE"
        return 1
    fi
    
    echo "✅ Custom profile found. To import it:"
    echo "   1. Open iTerm2"
    echo "   2. Go to iTerm2 > Preferences (⌘,)"
    echo "   3. Go to Profiles tab"
    echo "   4. Click 'Other Actions...' (gear icon at bottom left)"
    echo "   5. Select 'Import JSON Profiles...'"
    echo "   6. Choose the file: $PROFILE_FILE"
    echo "   7. Set 'Custom - Alex' as your default profile"
    echo ""
    echo "💡 The profile includes Roboto Mono font and your custom color scheme!"
}

# Function to install custom .zshrc
install_custom_zshrc() {
    echo "⚙️  Installing custom .zshrc..."
    
    # Get the script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    CUSTOM_ZSHRC="$SCRIPT_DIR/alex.zshrc"
    
    if [[ ! -f "$CUSTOM_ZSHRC" ]]; then
        echo "❌ Custom .zshrc file not found at $CUSTOM_ZSHRC"
        return 1
    fi
    
    # Backup existing .zshrc if it exists
    if [[ -f "$HOME/.zshrc" ]]; then
        BACKUP_NAME="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$HOME/.zshrc" "$BACKUP_NAME"
        echo "✅ Existing .zshrc backed up to: $BACKUP_NAME"
    fi
    
    # Copy custom .zshrc
    cp "$CUSTOM_ZSHRC" "$HOME/.zshrc"
    
    if [[ -f "$HOME/.zshrc" ]]; then
        echo "✅ Custom .zshrc installed successfully!"
        echo "💡 Your shell configuration is now ready with all enhancements"
    else
        echo "❌ Failed to install custom .zshrc"
        return 1
    fi
}

# Main installation process
main() {
    echo "Checking system requirements..."
    
    # Check and install Homebrew if needed
    check_homebrew
    
    # Update Homebrew to ensure we have the latest packages
    echo "🔄 Updating Homebrew..."
    brew update
    
    # Install Roboto Mono font
    install_roboto_mono
    
    # Check if iTerm2 is already installed
    if check_iterm2; then
        echo "🎉 iTerm2 is already installed. Nothing to do!"
    else
        install_iterm2
        echo "🎉 iTerm2 installation completed!"
    fi
    
    # Install Oh My Zsh
    install_oh_my_zsh
    
    # Install Powerlevel10k theme
    install_powerlevel10k
    
    # Install zsh-autosuggestions
    install_zsh_autosuggestions
    
    # Install zsh-syntax-highlighting
    install_zsh_syntax_highlighting
    
    # Install fzf
    install_fzf

    # Install Neovim
    install_neovim
    
    # Import custom iTerm2 profile
    import_iterm2_profile
    
    # Install custom .zshrc as the final step
    install_custom_zshrc
    
    echo ""
    echo "📝 Setup completed!"
    echo "🚀 Open iTerm2 and select the 'Custom - Alex' profile to use your custom configuration"
    echo "💡 Your custom .zshrc is now active with all zsh enhancements configured!"
    echo "🔄 Run 'source ~/.zshrc' or restart your terminal to apply all changes"
    echo ""
}

# Run the main function
main