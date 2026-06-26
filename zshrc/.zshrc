eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:/opt/homebrew/opt/php@8.1/bin:/opt/homebrew/bin/python3:/usr/bin/java:$PATH"
# for BASH ($HOME/bin:$HOME/.local/bin:)
# export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# General
export JAVA_HOME="/usr/bin"
export BASH_SILENCE_DEPRECATION_WARNING=1
export VISUAL="cursor"
export EDITOR="cursor"

export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
export MCP_TOOLS_PATH=/Users/mdowns/github/mcp-tools
export GITHUB_PATH=/Users/mdowns/github
export GITHUB_BOX_PATH=/Users/mdowns/github/box

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

# nvm (Oh My Zsh plugin): auto-switch the node version from a repo's .nvmrc.
# These zstyles MUST be set before oh-my-zsh.sh is sourced (below). The plugin's
# .nvmrc autoload is opt-in; without `autoload yes` it only sources nvm and never
# registers the chpwd hook. See plugins/nvm/README.md and https://github.com/nvm-sh/nvm#zsh
export NVM_DIR="$HOME/.nvm"
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes

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
alias cursorconfig="open -a 'Cursor' ~/.cursor/cli-config.json"
alias cursorsettings="open -a 'Cursor' ~/Library/Application\ Support/Cursor/User/settings.json"
alias cursorsettings2="open -a 'Cursor' /Users/mdowns/Library/Application Support/Cursor/User/settings.json"
alias cursorkb="open -a 'Cursor' ~/Library/Application\ Support/Cursor/User/keybindings.json"
alias npmconfig="code ~/.npmrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias sshconfig="code ~/.ssh/config"
alias zshconfig="cursor ~/dotfiles.code-workspace"
alias zshreload=". ~/.zshrc"

### Git / GitHub
alias gitconfig="code ~/.gitconfig"
alias gitignore="code ~/.gitignore"
alias prs="gh pr list --state=open"
alias prs-mine="gh pr list --author=@me --state=open"

# Git workflow functions
function ghopen() {
  local url
  url=$(git remote get-url origin 2>/dev/null) || { echo "Not a git repo"; return 1; }
  url="${url%.git}"
  if [[ "$url" == git@* ]]; then
    url="${url#git@}"
    url="https://${url/:/\/}"
  elif [[ "$url" != https://* && "$url" != http://* ]]; then
    url="https://${url}"
  fi
  open "$url"
}

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

# For secrets and Box-specific aliases use .zshrc.local

# nvm: loaded + auto-switched by the Oh My Zsh `nvm` plugin (see zstyle config near the plugins=() array)

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
__conda_setup="$('/Users/mdowns/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mdowns/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mdowns/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mdowns/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
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

# export PYENV_ROOT="$HOME/.pyenv"

# pyenv shim setup
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
## If needed to fix python...
# $ echo "alias pip=/usr/local/bin/pip3" >> ~/.zshrc
# alias python=/usr/local/bin/python3

# Function to update all GitHub repositories
function update_repos() {
    local github_dir=$GITHUB_BOX_PATH
    local updated_count=0
    local skipped_count=0
    local error_count=0
    local skipped_repos=()
    local error_repos=()
    local blocked_repo_paths=()

    _update_repos_is_ds_store_path() {
        local base=${1:t}
        [[ "$base" == .DS_Store || "$base" == '.DS_Store?' ]]
    }

    _update_repos_clean_ds_store_only() {
        local repo_path=$1
        local files=() f

        cd "$repo_path" || return 1

        files=("${(@f)$(git diff HEAD --name-only 2>/dev/null)}")
        files+=("${(@f)$(git diff --cached --name-only 2>/dev/null)}")
        files+=("${(@f)$(git ls-files --others --exclude-standard 2>/dev/null)}")
        files=(${(u)files})
        files=(${files:#})

        (( ${#files[@]} > 0 )) || return 1

        for f in "${files[@]}"; do
            _update_repos_is_ds_store_path "$f" || return 1
        done

        for f in "${files[@]}"; do
            if git ls-files --error-unmatch "$f" &>/dev/null; then
                git restore --staged --worktree -- "$f" 2>/dev/null
            else
                rm -f -- "$f"
            fi
        done

        git diff --quiet && git diff --cached --quiet && [[ -z "$(git status --porcelain)" ]]
    }

    _update_repos_show_changes() {
        local repo_path=$1
        local org_name=$2
        local repo_name=$3
        local modified_files untracked_files shortstat

        (
            cd "$repo_path" || return 1

            modified_files=("${(@f)$(git diff HEAD --name-only 2>/dev/null)}")
            modified_files=(${modified_files:#})
            shortstat=$(git diff HEAD --shortstat 2>/dev/null | sed 's/^[[:space:]]*//')
            untracked_files=("${(@f)$(git ls-files --others --exclude-standard 2>/dev/null)}")
            untracked_files=(${untracked_files:#})

            echo ""
            echo "   • $org_name/$repo_name"

            if (( ${#modified_files[@]} > 0 )); then
                echo "     Changed files:"
                for f in "${modified_files[@]}"; do
                    echo "       - $f"
                done
                if [[ -n "$shortstat" ]]; then
                    echo "     Diff size: $shortstat"
                fi
            fi

            if (( ${#untracked_files[@]} > 0 )); then
                echo "     Untracked files:"
                for f in "${untracked_files[@]}"; do
                    echo "       - $f"
                done
            fi
        )
    }

    echo "🔄 Starting repository updates in: $github_dir"
    echo "================================================"

    # Process substitution avoids a subshell so counters/arrays survive the loop
    while read -r git_dir; do
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

        # Drop .DS_Store-only noise (often tracked by others despite global gitignore)
        if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git status --porcelain)" ]; then
            if _update_repos_clean_ds_store_only "$repo_path"; then
                echo "   🧹 Dropped local .DS_Store changes; continuing..."
            fi
        fi

        # Check if there are local changes
        if ! git diff --quiet || ! git diff --cached --quiet; then
            echo "   ⏭️  Skipping: Local changes detected"
            ((skipped_count++))
            skipped_repos+=("$org_name/$repo_name (local changes)")
            blocked_repo_paths+=("$repo_path")
            continue
        fi

        # Check if repository is clean (no untracked files that matter)
        if [ -n "$(git status --porcelain)" ]; then
            echo "   ⏭️  Skipping: Working directory not clean"
            ((skipped_count++))
            skipped_repos+=("$org_name/$repo_name (working directory not clean)")
            blocked_repo_paths+=("$repo_path")
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
    done < <(find "$github_dir" -type d -name ".git")

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

    # Show file list and diff size for repos blocked by local changes
    if [ ${#blocked_repo_paths[@]} -gt 0 ]; then
        echo ""
        echo "📋 Local changes (could not pull):"
        for repo_path in "${blocked_repo_paths[@]}"; do
            local org_name=$(basename "$(dirname "$repo_path")")
            local repo_name=$(basename "$repo_path")
            _update_repos_show_changes "$repo_path" "$org_name" "$repo_name"
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
alias up-box="update_repos"

# Stow aliases
alias stow="stow --ignore=.DS_Store"

# >>> socket-firewall >>>
# Transparent Socket Firewall wrapping for package managers.
# Installed by Iru. Do not edit this block manually.
# Config (API key, custom registries) lives in ~/.sfw.config
# Only wraps install-related subcommands (install, add, update, ci, etc.)
# Bypass: SFW_BYPASS=1 npm install ...
if command -v sfw >/dev/null 2>&1; then
  # Remove any existing aliases that conflict with function definitions
  unalias npm npx yarn pnpm pip pip3 uv cargo mvn gradle gem bundle dotnet 2>/dev/null || true

  # Resolve pip binary before defining function (avoids bash command -v finding the function itself)
  _sfw_pip_cmd=$(command -v pip >/dev/null 2>&1 && echo pip || echo pip3)

  # JavaScript/TypeScript
  npm()    { if [ -n "${SFW_BYPASS:-}" ]; then command npm "$@"; else case "${1:-}" in install|i|ci|add|update|upgrade) command sfw npm "$@" ;; *) command npm "$@" ;; esac; fi; }
  npx()    { if [ -n "${SFW_BYPASS:-}" ]; then command npx "$@"; else command sfw npx "$@"; fi; }
  yarn()   { if [ -n "${SFW_BYPASS:-}" ]; then command yarn "$@"; else case "${1:-}" in install|add|up|upgrade|dlx) command sfw yarn "$@" ;; *) command yarn "$@" ;; esac; fi; }
  pnpm()   { if [ -n "${SFW_BYPASS:-}" ]; then command pnpm "$@"; else case "${1:-}" in install|i|add|update|upgrade|fetch|dlx) command sfw pnpm "$@" ;; *) command pnpm "$@" ;; esac; fi; }

  # Python
#   pip()    { if [ -n "${SFW_BYPASS:-}" ]; then command $_sfw_pip_cmd "$@"; else case "${1:-}" in install|download|wheel) command sfw $_sfw_pip_cmd "$@" ;; *) command $_sfw_pip_cmd "$@" ;; esac; fi; }
  pip3()   { if [ -n "${SFW_BYPASS:-}" ]; then command pip3 "$@"; else case "${1:-}" in install|download|wheel) command sfw pip3 "$@" ;; *) command pip3 "$@" ;; esac; fi; }
  uv()     { if [ -n "${SFW_BYPASS:-}" ]; then command uv "$@"; else case "${1:-}" in pip|add|sync|lock|install) command sfw uv "$@" ;; *) command uv "$@" ;; esac; fi; }

  # Rust
  cargo()  { if [ -n "${SFW_BYPASS:-}" ]; then command cargo "$@"; else case "${1:-}" in install|add|update|fetch) command sfw cargo "$@" ;; *) command cargo "$@" ;; esac; fi; }

  # Java/Scala/Kotlin
  mvn()    { if [ -n "${SFW_BYPASS:-}" ]; then command mvn "$@"; else command sfw mvn "$@"; fi; }
  gradle() { if [ -n "${SFW_BYPASS:-}" ]; then command gradle "$@"; else command sfw gradle "$@"; fi; }

  # Ruby
  gem()    { if [ -n "${SFW_BYPASS:-}" ]; then command gem "$@"; else case "${1:-}" in install|update) command sfw gem "$@" ;; *) command gem "$@" ;; esac; fi; }
  bundle() { if [ -n "${SFW_BYPASS:-}" ]; then command bundle "$@"; else case "${1:-}" in install|update|add) command sfw bundle "$@" ;; *) command bundle "$@" ;; esac; fi; }

  # .NET
  dotnet() { if [ -n "${SFW_BYPASS:-}" ]; then command dotnet "$@"; else case "${1:-}" in add|restore) command sfw dotnet "$@" ;; *) command dotnet "$@" ;; esac; fi; }
fi
# <<< socket-firewall <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mdowns/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mdowns/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mdowns/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mdowns/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
