# Git branch prompt completion
. /usr/local/etc/bash_completion.d/git-completion.bash

# Bash prompt
# export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ "
export PS1="\[\033[01;32m\]\d \t \w\$(__git_ps1) \[\033[00m\]$ "

# Don't use the Apple LLVM GCC
export CC=gcc-4.2
export CXX=g++-4.2

# Make the Ruby MySQL gem work
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib

# Ruby GC settings
export RUBY_HEAP_MIN_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

# Common aliases
alias ls='ls -lG' # colors + always use the long format
alias vless=/usr/share/vim/vim73/macros/less.sh # less with syntax highlighting
alias be='bundle exec'
alias ber='bundle exec rake'

# Git aliases
alias g='git'

alias gs='git status'                    # See a summary of which changes are staged for a commit (the top green section), which are modified
                                         #   on disk but not staged for a commit (the middle red section, "Changes not staged for commit"), and
                                         #   which are not yet tracked by the repo and need to be `git add`-ed (the bottom red section, "Untracked
                                         #   files").

alias ga='git add'                       # Add a file to the "stage" of changes that will be committed if you run `git commit` (i.e. move the file
                                         #   from the middle/bottom red sections to the top green section).
alias gap='git add -p'                   # Add a file to the "stage," but instead of adding the whole file at once, git will detect sections
                                         #   of changes, and for each section, will ask you if you want to add it or not.  Useful for when
                                         #   you've changed the same file for two different logical tasks, but only want to commit the changes
                                         #   related to one task.

alias gd='git diff'                      # Show the diff between the last commit and the new changes that you have not yet `git add`-ed.
                                         #   i.e. You know the middle red section of `git status` output?  `git diff` shows those changes.
alias gdc='git diff --cached'            # Show the diff of what would be committed if you were to run `git commit` right now.
                                         #   i.e. You know the top green section of `git status` output?  `git diff --cached` shows those changes.

alias gc='git commit'
alias gcm='git commit -m'                # Commit with a message, e.g. `git commit -m "Implemented a new feature."`.  The most common command you'll
                                         #   use when committing.
alias gcam='git commit -am'              # The `-a` flag automatically stages all changes (i.e. the middle red section of `git status` automatically
                                         #   gets treated as if they were in the top green section).  Useful for when you quickly want to commit
                                         #   all the changes you've made without having to `git add` every single file.  Also useful for when you've
                                         #   deleted a file and want to commit that deletion.
alias gca='git commit --amend'           # Revise the last commit.  Useful if you made a typo in the commit message.  If you made some extra changes
                                         #   that should logically get lumped into the last commit, you can `git add -p` those changes and then run
                                         #   `git commit --amend` to lump them into the last commit.
alias gcaa='git commit -a --amend'       # Revise the last commit by automatically lumping all your new changes in.  (Literally combines the effects
                                         #   of `-a` and `--amend`.

alias gl='git log'                       # Show the history of commits.  This will open a `less` buffer, which you can use `q` to quit out of.
alias glp='git log -p'                   # Show the history of commits, plus show the diff for each commit.

alias gp='git pull && git pull --rebase' # First, pull changes from origin.  This is good, but a side effect is that an ugly "Merge" commit will
                                         #   get automatically generated.  So we then also rebase locally to get rid of that ugly "Merge" commit.

alias gpom='git push origin master'      # Push to origin/master.  The most common case for pushing to origin.
alias gpo='git push origin'              # Push to origin.  Use this with a branch name, e.g. `gpo my-branch`.

alias gb='git branch'                    # List your local branches.
alias gbd='git branch -d'                # Delete a branch, e.g. `git branch -d branch-to-delete`.

alias gco='git checkout'                 # Checkout a branch, e.g. `git checkout other-branch`.  This will replace the current files on disk
                                         #   with the files as they exist on that branch.
alias gcob='git checkout -b'             # Create a new branch and switch to it immediately, e.g. `git checkout -b new-branch`.  The new branch will
                                         #   "fork" off whatever the current commit is at the time you run `git checkout -b`.

alias gr='git reset'
alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'            # Pretend like the last commit didn't happen.  This will still keep the changes of the last commit
                                         #  on disk, they will just no longer have been committed; you will now see them in the list of unstaged
                                         #  changes (i.e. the middle red secton of `git status`).  If you actually want to completely erase the
                                         #  last commit, do `git reset --hard HEAD~1`.


# Python virtualenvwrapper
# export WORKON_HOME=$HOME/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# workon analytics

export CODE_HOME=/Users/clizzin/code

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home" # for EC2
export JAVA_OPTS=-Xmx2048m

# Maven
export M2_REPO=$HOME/.m2/repository

# Hadoop
alias haddop='hadoop' # I make this goddamn typo all the time
export HADOOP_INSTALL=$CODE_HOME/hadoop-0.20.2-cdh3u0
export HADOOP_HOME=$HADOOP_INSTALL
export PATH=$HADOOP_INSTALL/bin:$PATH

# Hadoop LZO
export HADOOP_LZO_HOME=/Users/clizzin/code/hadoop-lzo
export HADOOP_CLASSPATH=$HADOOP_LZO_HOME/build/hadoop-lzo-0.4.10.jar:$HADOOP_HOME:$HADOOP_HOME/lib
export JAVA_LIBRARY_PATH=$HADOOP_LZO_HOME/build/hadoop-lzo-0.4.10/lib/native/Mac_OS_X-x86_64-64:$HADOOP_HOME/build/lib/native/Linux-amd64-64

# HBase
# export HBASE_INSTALL=$CODE_HOME/hbase-0.90.1-cdh3u0
# export HBASE_HOME=$HBASE_INSTALL
# export PATH=$HBASE_INSTALL/bin:$PATH

# Whirr
# export WHIRR_INSTALL=$CODE_HOME/whirr-0.5.0-incubating
# export PATH=$WHIRR_INSTALL/bin:$PATH
# export PATH=$WHIRR_INSTALL/contrib/python/src/py:$PATH
# alias whirr-hadoop='HADOOP_CONF_DIR=~/.whirr/hadoop hadoop'

# Pig
# export PIG_INSTALL=$CODE_HOME/pig-0.8.0-cdh3u0
# export PIG_HOME=$PIG_INSTALL
# export PATH=$PIG_HOME/bin:$PATH

# Hive
export HIVE_INSTALL=$CODE_HOME/hive-0.7.1-cdh3u2
export HIVE_HOME=$HIVE_INSTALL
export PATH=$HIVE_HOME/bin:$PATH

# Flume
# export FLUME_HOME=$CODE_HOME/flume-0.9.3-cdh3u0
# export FLUME_CONF_DIR=$FLUME_HOME/conf
# export PATH=$FLUME_HOME/bin:$PATH

# ZooKeeper
# export ZOOKEEPER_INSTALL=$CODE_HOME/zookeeper-3.3.3-cdh3u0
# export ZOOKEEPER_HOME=$ZOOKEEPER_INSTALL
# export PATH=$ZOOKEEPER_INSTALL/bin:$PATH

# Sqoop
# export SQOOP_HOME=$CODE_HOME/sqoop-1.3.0
# export PATH=$SQOOP_HOME/bin:$PATH

# Mahout
# export MAHOUT_HOME=/Users/clizzin/code/mahout-distribution-0.4  # 0.4 release
# export PATH=$PATH:$MAHOUT_HOME/bin

# Amazon Elastic MapReduce Ruby client
export PATH=$CODE_HOME/elastic-mapreduce-ruby:$PATH
alias emr=elastic-mapreduce

# Nutch
# export NUTCH_HOME=/Users/clizzin/code/apache-nutch-1.1
# export PATH=$PATH:$NUTCH_HOME/bin

# Node.js (via Homebrew)
NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

# OpenCV
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# Loads RVM into a shell session
[[ -s "/Users/clizzin/.rvm/scripts/rvm" ]] && source "/Users/clizzin/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# Loads Pythonbrew into a shell session
[[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# AWS EC2 API Tools
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_CERT="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/cert-*.pem)"

# AWS EC2 AMI Tools
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"

# AWS admin
export EC2_CERT="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/cert-*.pem)"

export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.15.1/jars"

# AWS IAM Tools
export AWS_IAM_HOME=/usr/local/Cellar/aws-iam-tools/HEAD/jars
export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master
source /Users/clizzin/scripts/set_aws_credentials.sh

# Add higher-priority binaries to PATH
export PATH=/usr/local/mysql/bin:$PATH              # MySQL
export PATH=/usr/local/bin:$PATH                    # Homebrew binaries
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # MacPorts

# Start MySQL daemon
# sudo /usr/local/mysql/bin/mysqld_safe

# Start Redis
alias airbnb_redis="redis-server $HOME/code/airbnb/config/redis/development.conf && redis-server $HOME/code/airbnb/config/redis/test.conf && echo 'redis daemons running...'"