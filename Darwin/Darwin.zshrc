# Load OMZ modules
plugins=(
  command-not-found
  z
  iterm2
  history-substring-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

sso() {
  ENV=$1
  TAG=$2
  if INSTANCE_ID=$(aws ec2 describe-instances \
                       --filters "Name=tag:Name,Values='$TAG'" \
                       --query="Reservations[].Instances[].[InstanceId][0]" \
                       --output text --profile $ENV); then
      echo "Found instance $INSTANCE_ID"
      aws ssm start-session --region ap-southeast-2 --target $INSTANCE_ID --profile $ENV
  else
      aws sso login --profile $ENV # login
      sso $ENV $TAG                # .. then repeat
  fi
}

alias sso-newprod="sso prod 'Web ASG / drupal-app-prod-au-drupal'"
alias sso-dev="sso dev 'Web ASG / drupal-app-dev1-drupal'"

# Path for MAMP
export PATH=$PATH:/Applications/MAMP/Library/bin