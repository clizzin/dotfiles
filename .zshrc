# Use asdf shims
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Homebrew shell completion
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Vi mode
bindkey -v

# Git aliases

alias git='TZ=UTC0 git'

alias g='git'

# Aliases for local development workflow

alias gs='git status'                    # See a summary of which changes are staged for a commit (the top green section),
                                         #   which are modified on disk but not staged for a commit (the middle red
                                         #   section, "Changes not staged for commit"), and which are not yet tracked by
                                         #   the repo and need to be `git add`-ed (the bottom red section, "Untracked
                                         #   files").

alias ga='git add'                       # Add a file to the "stage" of changes that will be committed if you run `git
                                         #   commit` (i.e. move the file from the middle/bottom red sections to the top
                                         #   green section).
alias gap='git add -p'                   # Add a file to the "stage," but instead of adding the whole file at once, git
                                         #   will detect sections of changes, and for each section, will ask you if you
                                         #   want to add it or not.  Useful for when you've changed the same file for two
                                         #   different logical tasks, but only want to commit the changes related to one
                                         #   task.

alias gd='git diff'                      # Show the diff between the last commit and the new changes that you have not yet
                                         #   `git add`-ed.  i.e. You know the middle red section of `git status` output? 
                                         #   `git diff` shows those changes.
alias gdc='git diff --cached'            # Show the diff of what would be committed if you were to run `git commit` right
                                         #   now.  i.e. You know the top green section of `git status` output?  `git diff
                                         #   --cached` shows those changes.

alias gc='git commit'
alias gcm='git commit -m'                # Commit with a message, e.g. `git commit -m "Implemented a new feature."`.  The
                                         #   most common command you'll use when committing.
alias gcam='git commit -am'              # The `-a` flag automatically stages all changes (i.e. the middle red section of
                                         #   `git status` automatically gets treated as if they were in the top green
                                         #   section).  Useful for when you quickly want to commit all the changes you've
                                         #   made without having to `git add` every single file.  Also useful for when
                                         #   you've deleted a file and want to commit that deletion.
alias gca='git commit --amend'           # Revise the last commit.  Useful if you made a typo in the commit message.  If
                                         #   you made some extra changes that should logically get lumped into the last
                                         #   commit, you can `git add -p` those changes and then run `git commit --amend`
                                         #   to lump them into the last commit.
alias gcaa='git commit -a --amend'       # Revise the last commit by automatically lumping all your new changes in.
                                         #   (Literally combines the effects of `-a` and `--amend`.

alias gcp='git cherry-pick'

alias gm='git merge'
alias gmm='git merge main'

# Aliases for undoing history

alias gr='git reset'
alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'            # Pretend like the last commit didn't happen.  This will still keep the changes
                                         #   of the last commit on disk, they will just no longer have been committed; you
                                         #   will now see them in the list of unstaged changes (i.e. the middle red section
                                         #   of `git status`).  If you actually want to completely erase the last commit,
                                         #   do `git reset --hard HEAD~1`.

# Aliases for branch manipulation

alias gb='git branch'                    # List your local branches.
alias gbm='git branch --merged'          # List local branches that have already been merged into the current branch
                                         #   (and are therefore safe to delete).
alias gbd='git branch -d'                # Delete a branch, e.g. `git branch -d branch-to-delete`.

alias gco='git checkout'                 # Checkout a branch, e.g. `git checkout other-branch`.  This will replace the
                                         #   current files on disk with the files as they exist on that branch.
alias gcom='git checkout main'           # Checkout the main branch.
alias gcob='git checkout -b'             # Create a new branch and switch to it immediately, e.g. `git checkout -b
                                         #   new-branch`.  The new branch will "fork" off whatever the current commit is
                                         #   at the time you run `git checkout -b`.

# Delete branches that have already been merged into the current branch.
alias gbmd='git branch --merged | grep -v \* | grep -v "^\s*main$" | xargs git branch -d'

# Aliases for rebase workflows

function gri {
  git rebase -i HEAD~${1:-1}
}

alias grc='git rebase --continue'

# Aliases for log commands
# git-log aliases all use topological order so that commits are shown in the
# order that they got merged into a branch, not the order in which they were
# written.  Also, each command is aliased to use --no-merges by default, but
# is accompanies by another alias with 'm' appended to include the merges.

alias gl='git log --date=local --topo-order --no-merges'               # Show the history of commits.  This will open a `less` buffer,
                                                                       #   which you can use `q` to quit out of.
alias glm='git log --date=local --graph'

alias glp='git log -p --date=local --topo-order -p --no-merges'        # Show the history of commits, plus the diff for each commit.
alias glpm='git log -p --date=local --topo-order'

alias glno='git log --date=local --name-only --topo-order --no-merges' # Show the history of commits, plus the filenames changed in
                                                                       #   each commit.
alias glnom='git log --date=local --name-only --topo-order'

# Aliases for syncing local and remotes

alias gfo='git fetch origin'
alias gtfo='git fetch origin'
alias grpo='git remote prune origin'

alias gp='git pull --no-edit && git rebase && git remote prune origin && gbmd' # First, pull changes from origin.  Use a merge
                                                                               #   instead of a rebase so that the post-merge
                                                                               #   hook will fire.
                                                                               # Then, to get rid of the ugly "Merge" commit,
                                                                               #   rebase locally against origin/main.
                                                                               # Then, prune any origin branches that have
                                                                               #   been deleted at origin.
                                                                               # Then, prune any local branches that have been merged.

alias gpom='git push origin main'                                      # Push to origin/main.  The most common case for
                                                                       #   pushing to origin.
alias gpo='git push origin'                                            # Push to origin.  Use this with a branch name,
                                                                       #   e.g. `gpo my-branch`.
alias gpfo='git push -f origin $(git rev-parse --abbrev-ref HEAD)'     # Force-push the current branch to origin.  Very
                                                                       #   dangerous!  Use when you've rebased your local
                                                                       #   history and want to force the remote to accept
                                                                       #   the rewritten commits.  It's also a good idea
                                                                       #   to `git config --global push.default current`.

# Aliases for GitHub features (via hub, to which git has been aliased)

alias gpr='git pull-request'

# postgresql 16
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/postgresql@16/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@16/include"
