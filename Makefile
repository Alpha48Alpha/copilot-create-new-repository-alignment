# Makefile — common developer tasks
# Run `make help` to see available targets.

.DEFAULT_GOAL := help

.PHONY: help setup validate-git

## help: Show this help message
help:
	@echo ""
	@echo "Usage: make <target>"
	@echo ""
	@grep -E '^## [a-zA-Z_-]+:' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {sub(/^## /, "", $$1); printf "  %-20s %s\n", $$1, $$2}'
	@echo ""

## setup: Run the automated environment setup script
setup:
	@bash scripts/setup.sh

## validate-git: Verify that git user.name and user.email are configured
validate-git:
	@echo "Checking Git configuration..."
	@git config --global user.name  > /dev/null 2>&1 || (echo "ERROR: git user.name is not set. Run: git config --global user.name \"Your Name\"" && exit 1)
	@git config --global user.email > /dev/null 2>&1 || (echo "ERROR: git user.email is not set. Run: git config --global user.email \"you@example.com\"" && exit 1)
	@echo "Git configuration OK."
	@echo "  user.name  = $$(git config --global user.name)"
	@echo "  user.email = $$(git config --global user.email)"
