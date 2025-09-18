# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH:/opt/homebrew/opt/php@8.1/bin:/opt/homebrew/bin/python3:/usr/bin/java:$PATH:"
# for BASH ($HOME/bin:$HOME/.local/bin:)
# export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# General
export JAVA_HOME="/usr/bin"
export BASH_SILENCE_DEPRECATION_WARNING=1
export VISUAL="cursor"
export EDITOR="cursor"

# Load local/private configuration if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='cursor'
fi

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# fuzzy matching
source <(fzf --zsh)

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# colorize
# ssh-agent
# zsh-autosuggestions
plugins=(
    colored-man-pages  # Colored man pages
    common-aliases
    copypath
    dircycle
    docker
    dotenv
    git
    gh
    history
    kubectl
    macos
    # mpde
    npm
    nvm
    pip
    pipenv
    poetry
    pyenv
    python
    rbenv
    sudo
    timer
    vscode
    yarn
    zsh-interactive-cd
    # zsh-syntax-highlighting
)

# ZSH extensions
# multi-file renaming
autoload zmv

## ssh-agent
### Enable agent-forwarding
# zstyle :omz:plugins:ssh-agent agent-forwarding on

# source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
## Me
### For a full list of active aliases, run `alias`.

### Config files
alias cursorsettings="open -a 'Cursor' ~/Library/Application\ Support/Cursor/User/settings.json"
alias cursorkb="open -a 'Cursor' ~/Library/Application\ Support/Cursor/User/keybindings.json"
alias npmconfig="code ~/.npmrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias sshconfig="code ~/.ssh/config"
alias zshconfig="cursor ~/.zshrc"
alias zshreload=". ~/.zshrc"

### Git / GitHub
alias gitconfig="code ~/.gitconfig"
alias gitignore="code ~/.gitignore"
alias prs="gh pr list --state=open"
alias prs-mine="gh pr list --author=@me --state=open"

# Git workflow functions
function gpr() {
    git push -u origin $(git branch --show-current)
    gh pr create --fill
}

function gsync() {
    git fetch origin
    git rebase origin/$(git branch --show-current)
}

### file system
alias lf="find . -maxdepth 2 -type d -ls"
alias projects="cd ~/github && ls -la"

#### Functions
function cdf() {
    cd "$(find . -type d -name "*$1*" | head -1)"
}

function findfile() {
    find . -name "*$1*" -type f
}

function finddir() {
    find . -name "*$1*" -type d
}

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick repo metrics
function repostats() {
    echo "📊 Repo Statistics:"
    echo "Files: $(find . -type f | wc -l)"
    echo "Lines of code: $(find . -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.java" | xargs wc -l | tail -1)"
    echo "Git commits: $(git rev-list --count HEAD)"
    echo "Last commit: $(git log -1 --format=%cr)"
}

# Box-specific aliases moved to .zshrc.local



export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

### ZSH OPTS / DEFAULTS
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User Configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $ZSH/oh-my-zsh.sh

## DISABLED
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

## Just in case -- python compiler support
# zlib is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# For compilers to find zlib you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
#   export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

export PYENV_ROOT="$HOME/.pyenv"

# pyenv shim setup
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
## If needed to fix python...
# $ echo "alias pip=/usr/local/bin/pip3" >> ~/.zshrc
# alias python=/usr/local/bin/python3

# Function to update all GitHub repositories
function update_all_repos() {
    local github_dir="${1:-$HOME/github}"
    local updated_count=0
    local skipped_count=0
    local error_count=0
    local skipped_repos=()
    local error_repos=()

    echo "🔄 Starting repository updates in: $github_dir"
    echo "================================================"

    # Find all git repositories recursively
    find "$github_dir" -type d -name ".git" | while read -r git_dir; do
        local repo_path=$(dirname "$git_dir")
        local repo_name=$(basename "$repo_path")
        local org_name=$(basename "$(dirname "$repo_path")")

        echo ""
        echo "📁 Processing: $org_name/$repo_name"
        echo "   Path: $repo_path"

        # Change to repository directory
        cd "$repo_path" || {
            echo "   ❌ Failed to change directory"
            ((error_count++))
            skipped_repos+=("$org_name/$repo_name (failed to change directory)")
            continue
        }

        # Check if there are local changes
        if ! git diff --quiet || ! git diff --cached --quiet; then
            echo "   ⏭️  Skipping: Local changes detected"
            ((skipped_count++))
            skipped_repos+=("$org_name/$repo_name (local changes)")
            continue
        fi

        # Check if repository is clean (no untracked files that matter)
        if [ -n "$(git status --porcelain)" ]; then
            echo "   ⏭️  Skipping: Working directory not clean"
            ((skipped_count++))
            skipped_repos+=("$org_name/$repo_name (working directory not clean)")
            continue
        fi

        # Determine main branch (main or master)
        local main_branch=""
        if git show-ref --verify --quiet refs/heads/main; then
            main_branch="main"
        elif git show-ref --verify --quiet refs/heads/master; then
            main_branch="master"
        elif git show-ref --verify --quiet refs/heads/dev; then
            main_branch="dev"
        else
            echo "   ❌ No main, dev, or master branch found"
            ((error_count++))
            error_repos+=("$org_name/$repo_name (no main/dev/master branch)")
            continue
        fi

        echo "   🌿 Switching to $main_branch branch"

        # Switch to main branch
        if ! git checkout "$main_branch" >/dev/null 2>&1; then
            echo "   ❌ Failed to checkout $main_branch"
            ((error_count++))
            error_repos+=("$org_name/$repo_name (failed to checkout $main_branch)")
            continue
        fi

        # Pull latest changes
        echo "   ⬇️  Pulling latest changes..."
        if git pull origin "$main_branch" >/dev/null 2>&1; then
            echo "   ✅ Successfully updated"
            ((updated_count++))
        else
            echo "   ❌ Failed to pull changes"
            ((error_count++))
            error_repos+=("$org_name/$repo_name (failed to pull changes)")
        fi
    done

    echo ""
    echo "================================================"
    echo "📊 Update Summary:"
    echo "   ✅ Updated: $updated_count"
    echo "   ⏭️  Skipped: $skipped_count"
    echo "   ❌ Errors: $error_count"

    # Show skipped repositories if any
    if [ ${#skipped_repos[@]} -gt 0 ]; then
        echo ""
        echo "⏭️  Skipped Repositories:"
        for repo in "${skipped_repos[@]}"; do
            echo "   • $repo"
        done
    fi

    # Show error repositories if any
    if [ ${#error_repos[@]} -gt 0 ]; then
        echo ""
        echo "❌ Error Repositories:"
        for repo in "${error_repos[@]}"; do
            echo "   • $repo"
        done
    fi
}

# Alias for convenience
alias update-repos="update_all_repos"

# Stow aliases
alias stow="stow --ignore=.DS_Store"
