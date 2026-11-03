#!/usr/bin/env bash
# Build Formula/c9s.rb from source in a throwaway local tap, then run its test and an audit.
# Needs Homebrew (macOS). The audit is advisory.
set -euo pipefail
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1
brew tap-new local/c9s
tap="$(brew --repo local/c9s)"
mkdir -p "$tap/Formula"
cp "$dir/Formula/c9s.rb" "$tap/Formula/c9s.rb"
brew install --build-from-source --verbose local/c9s/c9s
brew test local/c9s/c9s
brew audit --strict --new local/c9s/c9s || echo "::warning::brew audit reported problems"
