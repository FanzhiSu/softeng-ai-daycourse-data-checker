#!/usr/bin/env bash
#
# Safe checkpoint recovery for the Research Data Checker teaching repository.
#
# Usage: tools/recover.sh <baseline|p2|p3|p4>
#
# The script restores a cumulative checkpoint into the working tree as
# UNSTAGED changes, so that Practical 5 still has real work to inspect.
#
# It never discards work: before changing anything it writes a full tarball
# backup of the working tree and stashes tracked/untracked changes. Both are
# recoverable afterwards.
#
set -euo pipefail

usage() {
    echo "Usage: $0 <baseline|p2|p3|p4>" >&2
    exit 2
}

[ "$#" -eq 1 ] || usage
LEVEL="$1"

case "$LEVEL" in
    baseline) WANT="main" ;;
    p2) WANT="recovery/p2" ;;
    p3) WANT="recovery/p3" ;;
    p4) WANT="recovery/p4" ;;
    *) usage ;;
esac

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Error: not inside a Git working tree." >&2
    exit 1
}

# Resolve the checkpoint ref, accepting either a local branch or a remote
# tracking branch (forks expose checkpoints as origin/<name>).
REF=""
for candidate in "$WANT" "origin/$WANT"; do
    if git rev-parse --verify --quiet "$candidate" >/dev/null 2>&1; then
        REF="$candidate"
        break
    fi
done

if [ -z "$REF" ]; then
    echo "Error: checkpoint '$WANT' not found." >&2
    echo "Try fetching it first, for example:" >&2
    echo "  git fetch origin $WANT" >&2
    exit 1
fi

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

TS="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$REPO_ROOT/.recovery-backups"
mkdir -p "$BACKUP_DIR"
BACKUP_FILE="$BACKUP_DIR/worktree-$TS.tgz"

# 1. Full tarball backup of the working tree (tracked and untracked).
tar -czf "$BACKUP_FILE" \
    --exclude='.git' \
    --exclude='.recovery-backups' \
    --exclude='.venv' \
    --exclude='.venv*' \
    --exclude='__pycache__' \
    --exclude='*.egg-info' \
    --exclude='.pytest_cache' \
    -C "$REPO_ROOT" . >/dev/null
echo "Backup written to: $BACKUP_FILE"

# 2. Stash uncommitted work (tracked modifications and untracked files).
STASH_REF=""
if ! git diff --quiet \
    || ! git diff --cached --quiet \
    || [ -n "$(git ls-files --others --exclude-standard)" ]; then
    git stash push -u -m "recovery-$LEVEL-$TS" >/dev/null
    STASH_REF="$(git rev-parse --verify --quiet 'stash@{0}' || true)"
    echo "Uncommitted work stashed as: ${STASH_REF:-stash@{0}}"
else
    echo "No uncommitted work to stash."
fi

# 3. Reset tracked files to the baseline (main) and remove untracked leftovers.
#    Ignored paths such as .venv and .recovery-backups are preserved.
git switch --force main >/dev/null 2>&1 || git checkout --force main >/dev/null
git clean -fd >/dev/null

# 4. Apply the checkpoint into the working tree as unstaged changes.
if [ "$LEVEL" != "baseline" ]; then
    git checkout "$REF" -- .
    git reset -q
fi

echo
echo "Recovered to '$LEVEL'."
echo "The working tree now contains the checkpoint as UNSTAGED changes."
if [ -n "$STASH_REF" ]; then
    echo "Your previous work is preserved. Restore it with:"
    echo "  git stash pop          # or: git stash apply $STASH_REF"
fi
echo "A tarball backup is at: $BACKUP_FILE"
