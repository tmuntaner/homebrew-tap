# homebrew-tap

Homebrew tap for [tmuntaner](https://github.com/tmuntaner)'s tools. Currently, it provides:

- `c9s`: [c9s](https://github.com/tmuntaner/credential-manager)

```bash
brew install tmuntaner/tap/c9s
```

Or tap once and install by name:

```bash
brew tap tmuntaner/tap
brew install c9s
```

The formula builds from source, so installing takes a few minutes. Homebrew provides the Rust toolchain.

## How it works

- `templates/c9s.rb.in` is the formula template. `Formula/c9s.rb` is generated from it; don't edit that by hand.
- `.github/workflows/update.yml` runs daily (and on demand: Actions > Update formula > Run workflow, optionally
  with a tag). It finds the newest release of `tmuntaner/credential-manager`, renders the formula with the tag
  tarball's sha256, builds it with `scripts/verify.sh` (install, `brew test`, advisory `brew audit`), and only then
  commits it. A failing build leaves the previous formula in place.
- `.github/workflows/test.yml` runs the same verification on pull requests that touch the formula, template or scripts.

## Seeding this repository

1. Push the contents of this directory to the public repo `tmuntaner/homebrew-tap`.
2. Run the *Update formula* workflow once by hand to generate `Formula/c9s.rb`.
3. Make sure the formula workflow can push: Settings > Actions > General > Workflow permissions can stay at the
   default, since `update.yml` requests `contents: write` itself (unless the branch is protected against it).

No tokens or secrets are needed: the source repository is public and the tap pushes with its own `GITHUB_TOKEN`.
