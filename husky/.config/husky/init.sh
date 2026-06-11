# Husky v9 user-level hook init (sourced before every git hook).
# GUI git clients (GitHub Desktop, etc.) run hooks with the bare launchd PATH
# (/usr/bin:/bin:/usr/sbin:/sbin) and never run path_helper, so Homebrew's bin
# dir is missing and `node` can't be found. Prepend it here so commitlint and
# other Node-based hooks resolve `node`/`npx` regardless of how the hook is run.
case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) export PATH="/opt/homebrew/bin:$PATH" ;;
esac
