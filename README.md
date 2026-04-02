# cast-observe Homebrew Tap

Homebrew tap for [cast-observe](https://github.com/ek33450505/cast-observe) — session-level observability for Claude Code.

## Install

```bash
brew tap ek33450505/cast-observe
brew install cast-observe
```

## Setup

After installing, run the one-time setup to wire hooks and initialize the database:

```bash
cast-observe install
```

Then start a Claude Code session and run:

```bash
cast-observe status
```

## More

- Source: https://github.com/ek33450505/cast-observe
- Issues: https://github.com/ek33450505/cast-observe/issues
