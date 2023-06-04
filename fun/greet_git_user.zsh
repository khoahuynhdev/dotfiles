
# Define some colors for the prompt
# Set the color variables
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
# No Color Greeting prompt for zsh

boottime=`sysctl -n kern.boottime | awk '{print $4}' | sed 's/,//g'`
unixtime=`date +%s`
timeAgo=$(($unixtime - $boottime))
uptime=`awk -v time=$timeAgo 'BEGIN { seconds = time % 60; minutes = int(time / 60 % 60); hours = int(time / 60 / 60 % 24); days = int(time / 60 / 60 / 24); printf("%.0f days, %.0f hours, %.0f minutes, %.0f seconds", days, hours, minutes, seconds); exit }'`
function greet() {
  local git_user=""
  local git_email=""
  if git rev-parse --git-dir >/dev/null 2>&1; then
    git_user="$(git config --get user.name)"
    git_email="$(git config --get user.email)"
    if [ -n "$git_user" ]; then
      git_user=" ($git_user"
      if [ -n "$git_email" ]; then
        git_user="$git_user $git_email)"
      else
        git_user="$git_user)"
      fi
    fi
  fi
  echo -e "Greeting $GREEN$(git config --get user.name)$NC\nIt is $BLUE$(date "+%a %b %d %I:%M %p")$NC.\nThe system has been up for $uptime."
}

# Define a function to get the Git username (if available)
function get_git_user() {
  local user="$(git config --get user.name)"
  if [ -n "$user" ]; then
    echo "$user@"
  fi
}

greet
