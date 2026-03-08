#!/usr/bin/env bash
# scripts/setup.sh
# Automates the local development environment setup for this repository.
# Usage: bash scripts/setup.sh

set -euo pipefail

# ─── Colours ────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

info()    { echo -e "${CYAN}[INFO]${RESET}  $*"; }
success() { echo -e "${GREEN}[OK]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[WARN]${RESET}  $*"; }
error()   { echo -e "${RED}[ERROR]${RESET} $*" >&2; }

# ─── Banner ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${CYAN}================================================${RESET}"
echo -e "${CYAN}  copilot-create-new-repository-alignment${RESET}"
echo -e "${CYAN}  Development Environment Setup${RESET}"
echo -e "${CYAN}================================================${RESET}"
echo ""

# ─── 1. Check Git ────────────────────────────────────────────────────────────
info "Checking for Git..."
if ! command -v git &>/dev/null; then
    error "Git is not installed. Please install Git from https://git-scm.com and re-run this script."
    exit 1
fi
GIT_VERSION=$(git --version | awk '{print $3}')
success "Git found: v${GIT_VERSION}"

# Minimum required Git version (2.x)
MAJOR=$(echo "$GIT_VERSION" | cut -d. -f1)
if [[ "$MAJOR" -lt 2 ]]; then
    warn "Git v${GIT_VERSION} is older than the recommended minimum (v2.x). Consider upgrading."
fi

# ─── 2. Verify we are inside a Git repository ────────────────────────────────
info "Verifying Git repository..."
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    error "This directory is not a Git repository. Please clone the project first:"
    echo "  git clone https://github.com/Alpha48Alpha/copilot-create-new-repository-alignment.git"
    exit 1
fi
success "Inside a valid Git repository."

# ─── 3. Confirm we are on the correct remote ─────────────────────────────────
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "")
if [[ -z "$REMOTE_URL" ]]; then
    warn "No 'origin' remote detected. Some features may not work as expected."
else
    success "Remote origin: ${REMOTE_URL}"
fi

# ─── 4. Recommended Git configuration ────────────────────────────────────────
info "Checking Git user configuration..."
GIT_USER=$(git config --global user.name  2>/dev/null || echo "")
GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [[ -z "$GIT_USER" ]]; then
    warn "git config --global user.name is not set."
    echo "  Set it with: git config --global user.name \"Your Name\""
else
    success "git user.name  = ${GIT_USER}"
fi

if [[ -z "$GIT_EMAIL" ]]; then
    warn "git config --global user.email is not set."
    echo "  Set it with: git config --global user.email \"you@example.com\""
else
    success "git user.email = ${GIT_EMAIL}"
fi

# ─── 5. Set recommended Git settings for the local repo ──────────────────────
info "Applying recommended local Git settings..."

# Ensure line-ending normalisation
git config core.autocrlf input
success "core.autocrlf = input (Unix-style line endings)"

# Speed up status/diff on large repos
git config feature.manyFiles true
success "feature.manyFiles = true"

# ─── 6. Fetch latest changes ─────────────────────────────────────────────────
info "Fetching latest changes from origin..."
if git fetch --all --prune 2>/dev/null; then
    success "Repository is up to date."
else
    warn "Could not fetch from remote. You may be offline."
fi

# ─── 7. Summary ──────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}================================================${RESET}"
echo -e "${GREEN}  Setup complete!${RESET}"
echo -e "${GREEN}================================================${RESET}"
echo ""
echo "  Next steps:"
echo "  • Read the contributing guidelines : CONTRIBUTING.md"
echo "  • Review the code of conduct       : CODE_OF_CONDUCT.md"
echo "  • See available make targets       : make help"
echo ""
