#!/usr/bin/env bash
# Write Formula/c9s.rb for a release tag of tmuntaner/credential-manager.
# Usage: update.sh <tag>
set -euo pipefail
[ "$#" -eq 1 ] || { echo "usage: $0 <tag>" >&2; exit 1; }
tag="$1"
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
url="https://github.com/tmuntaner/credential-manager/archive/refs/tags/${tag}.tar.gz"
sha="$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)"
mkdir -p "$dir/Formula"
"$dir/scripts/render.sh" "$url" "$sha" > "$dir/Formula/c9s.rb"
