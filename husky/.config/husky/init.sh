# Husky v9 user-level hook init (sourced before every git hook).
#
# GUI git clients (GitHub Desktop, etc.) run hooks with the bare launchd PATH
# (/usr/bin:/bin:/usr/sbin:/sbin) and never run path_helper or your shell rc,
# so neither Homebrew's nor nvm's node is on PATH. Worse, a repo may pin a
# specific node version (.nvmrc / package.json "engines"), so just adding any
# node is not enough -- a mismatched version makes tools like yarn refuse to run.
#
# Load nvm and select the repo's version (.nvmrc, resolved from the hook's cwd
# = repo root) so Node-based hooks (commitlint, `yarn lint`) use the version the
# project requires. Verified working under macOS /bin/sh (bash 3.2 posix mode).
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  # --no-use: load nvm without switching to the default version yet (faster).
  . "$NVM_DIR/nvm.sh" --no-use
  if [ -f .nvmrc ]; then
    nvm use --silent >/dev/null 2>&1 || nvm use default --silent >/dev/null 2>&1
  else
    nvm use default --silent >/dev/null 2>&1
  fi
fi

# Always add Homebrew to PATH (omitted from GUI client's PATH because path_helper
# never runs for GUI apps). Required for Corepack-managed binaries like yarn.
case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) export PATH="/opt/homebrew/bin:$PATH" ;;
esac
