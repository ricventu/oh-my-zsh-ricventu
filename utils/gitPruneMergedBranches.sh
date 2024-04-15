#!/bin/bash

# List of branches to exclude from deletion
protected_branches="master main develop staging"

# Function to filter branches, excluding the protected ones
filter_branches() {
  for branch in $1; do
    skip=
    for protected_branch in $protected_branches; do
      if [[ $branch == $protected_branch ]]; then
        skip=1
        break
      fi
    done
    [[ -n $skip ]] || echo $branch
  done
}

# Check if we are in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "This script must be run from within a Git repository."
  exit 1
fi

# Fetch the latest state of the remote
git fetch --prune

echo "Fetching merged branches..."

# List local merged branches and filter out protected branches
local_merged_branches=$(git branch --merged | grep -v '^[*]' | xargs)
local_merged_branches=$(filter_branches "$local_merged_branches")
echo "Local merged branches:"
echo "$local_merged_branches"

# Ask user for confirmation to delete local branches
if [ -n "$local_merged_branches" ]; then
  read -p "Do you want to delete these local branches? [y/N] " confirm_local
  if [[ $confirm_local =~ ^[Yy]$ ]]; then
    echo "Deleting local merged branches..."
    echo "$local_merged_branches" | xargs -n 1 git branch -d
  else
    echo "Local branch deletion canceled."
  fi
else
  echo "No local merged branches to delete."
fi

# List remote merged branches and filter out protected branches
remote_merged_branches=$(git branch -r --merged | grep -v 'master\|main\|develop\|staging' | sed 's/ *origin\///' | xargs)
remote_merged_branches=$(filter_branches "$remote_merged_branches")
echo "Remote merged branches:"
echo "$remote_merged_branches"

# Ask user for confirmation to delete remote branches
if [ -n "$remote_merged_branches" ]; then
  read -p "Do you want to delete these remote branches? [y/N] " confirm_remote
  if [[ $confirm_remote =~ ^[Yy]$ ]]; then
    echo "Deleting remote merged branches..."
    for branch in $remote_merged_branches; do
      git push origin --delete "$branch"
    done
  else
    echo "Remote branch deletion canceled."
  fi
else
  echo "No remote merged branches to delete."
fi