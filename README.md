# sketchybar-config

## Installation
1. Install the dependencies
```sh
brew install task # Taskwarrior for displaying todo list

# Install sketchybar
brew tap FelixKratz/formulae
brew install sketchybar

# Install nerd font
brew install --cask font-hack-nerd-font
```

2. Replace your config files with this repo

```sh
# Create a backup of your previous config 
mv -r ~/.config/sketchybar/ ~/.config/sketchybar-backup
# Pull this repo and use it as your primary config
git clone https://github.com/hoangthanhtien/sketchybar-config.git ~/.config/sketchybar

# Reload to load the config
sketchybar --reload
```
