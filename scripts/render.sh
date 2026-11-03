#!/usr/bin/env bash
# Render the formula template to stdout.
# Usage: render.sh <tarball-url> <sha256>
set -euo pipefail
[ "$#" -eq 2 ] || { echo "usage: $0 <tarball-url> <sha256>" >&2; exit 1; }
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
sed -e "s|@URL@|$1|" -e "s|@SHA256@|$2|" "$dir/templates/c9s.rb.in"
