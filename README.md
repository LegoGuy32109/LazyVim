# 💤 Josh Hale's LazyVim on Omarchy

## `.config/hypr/hyprland.conf`
```
source = ~/.config/nvim/omarchy_config/hypr/bindings.conf
```

## `.bashrc`
```
alias l='ls'
alias ll='lsa'
alias lg='lazygit'
alias sb='source ~/.bashrc'
alias eb='nvim ~/.bashrc'
alias c='clear'
open_fileexplorer() {
  local dir="${1:-.}"
  nautilus "$dir" >/dev/null 2>&1 &
}
alias ex='open_fileexplorer'

export GEOH_SHARED_ENVIRONMENT_DIRECTORY="/home/josh/OneDrive/Environments"
export LG_CONFIG_FILE="/home/josh/.config/nvim/omarchy_config/lazygit.yml"
```
