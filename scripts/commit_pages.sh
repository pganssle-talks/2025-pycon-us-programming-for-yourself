#! /usr/bin/env bash
set -e

WORKTREE_LOCATION="docs"
PRIMARY_BRANCH="master"
PROJECT_ROOT="$(pwd)"
# HOME="$(pwd)"

# Copy Git user configuration from the main repo to the worktree
GIT_USER_NAME=$(git -C "${HOME}" config user.name || echo "Pages Updater")
GIT_USER_EMAIL=$(git -C "${HOME}" config user.email || echo "noreply@example.com")

# If no changes are necessary, we don't have to check the error conditions
cd "${WORKTREE_LOCATION}"
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit"
    exit 0
fi
cd "${PROJECT_ROOT}"

# First ensure that we're working on the primary source branch
CURRENT_BRANCH="$(git symbolic-ref --short -q HEAD)"
if [[ "${CURRENT_BRANCH}" != "${PRIMARY_BRANCH}" ]]; then
    echo "Currently on branch ${CURRENT_BRANCH}, not ${PRIMARY_BRANCH}"
    exit 1
fi

# Next check the status of the current working directory — if it's not clean,
# we don't want to automatically commit the result to GH pages.
if [ ! -z "$(git status --porcelain)" ]; then
    echo "Master branch is not clean"
    exit 2
fi

if [ -f ".gitignore.pages" ]; then
    GITIGNORE_LOC="$(realpath .gitignore.pages)"
else
    GITIGNORE_LOC="$(realpath .gitignore)"
fi

cd "${WORKTREE_LOCATION}"

cp "$GITIGNORE_LOC" ".gitignore"

git add -u

UNTRACKED_FILES_STR="$(git ls-files -o --exclude-standard)"
if [ -n "$UNTRACKED_FILES_STR" ]; then
    # Convert list of untracked files to array: git ls-files is a
    # newline-delimited string, and file names may have spaces in them, so `git
    # add "${UNTRACKED_FILES_STR}"` will try to add one file with a very long
    # name, and `git add $UNTRACKED_FILES_STR` would add file names delimited
    # by ANY whitespace.
    readarray -t UNTRACKED_FILES <<<"$UNTRACKED_FILES_STR"
    git add -- "${UNTRACKED_FILES[@]}"
fi

git commit -m "Build pages for $(git rev-parse ${PRIMARY_BRANCH} | head -n 16)" --author="${GIT_USER_NAME} <${GIT_USER_EMAIL}>"
