# PowerLevel10k Lean config, customized. Source is in PowerLevel10k repo.
# When in doubt, consult: https://github.com/romkatv/powerlevel10k/blob/master/config/p10k-lean.zsh
# Or have a look at powerlevel10k/config/p10k-lean.zsh
#
# Tip: Looking for a nice color? Here's a one-liner to print colormap.
#
#   for i in {0..255}; do print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'}; done

if [[ -o 'aliases' ]]; then
  # Temporarily disable aliases.
  'builtin' 'unsetopt' 'aliases'
  local p10k_lean_restore_aliases=1
else
  local p10k_lean_restore_aliases=0
fi

() {
  emulate -L zsh
  setopt no_unset

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    os_icon
    dir
    vcs
    # =========================[ Line #2 ]=========================
    newline
    prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    status
    root_indicator
    command_execution_time
    background_jobs
    context
    # =========================[ Line #1 ]=========================
    newline
    battery
    time
  )

  typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false               # align the first left/right lines
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol

  # Disable segment icons by default.
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=

  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  # Regarding newline, ruler and first_prompt_gap
  # ADD_NEWLINE adds a new line to each prompt, SHOW_RULER shows a line before each prompt
  # MULTILINE_FIRST_PROMPT_GAP shows the characters between left prompt and right prompt
  #
  # ADD_NEWLINE = true => SHOW_RULER should be false and MULTILINE_FIRST_PROMPT_GAP_CHAR should be '.' or '-'
  # SHOW_RULER = true => ADD_NEWLINE = false and MULTILINE_FIRST_PROMPT_GAP_CHAR should be ' '
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_SHOW_RULER=false
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '

  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    # The color of the filler.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=237
    # Add a space between the end of left prompt and the filler.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
    # Add a space between the filler and the start of right prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
    # Start filler from the edge of the screen if there are no left segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    # End filler on the edge of the screen if there are no right segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  # OS identifier color.
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=212

  # Green prompt symbol if the last command succeeded.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=76
  # Red prompt symbol if the last command failed.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=196
  # Default prompt symbol.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  # Prompt symbol in command vi mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  # Prompt symbol in visual vi mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

  # Enable special styling for non-writable directories.
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
  typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='%214F%B!w'
  # Default current directory color.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=12

  # Truncate dir in prompt
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=4
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER='(.shorten_folder_marker|.bzr|CVS|.git|.hg|.svn|.terraform|.citc)'
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  # If set to true, embed a hyperlink into the directory. Useful for quickly
  # opening a directory in the file manager simply by clicking the link.
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

  # Git status plugin: feature:master#tag ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
  # https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
  local vcs=''
  # 'feature' or '@72f5c8a' if not on a branch.
  vcs+='%76F${${VCS_STATUS_LOCAL_BRANCH//\%/%%}:-%f@%76F${VCS_STATUS_COMMIT[1,8]}}'
  # ':master' if the tracking branch name differs from local branch.
  vcs+='${${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH}:+%f:%76F${VCS_STATUS_REMOTE_BRANCH//\%/%%}}'
  # '#tag' if on a tag.
  vcs+='${VCS_STATUS_TAG:+%f#%76F${VCS_STATUS_TAG//\%/%%}}'
  # ⇣42 if behind the remote.
  vcs+='${${VCS_STATUS_COMMITS_BEHIND:#0}:+ %76F⇣${VCS_STATUS_COMMITS_BEHIND}}'
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  # If you want '⇣42 ⇡42' instead, replace '${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }' with ' '.
  vcs+='${${VCS_STATUS_COMMITS_AHEAD:#0}:+${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }%76F⇡${VCS_STATUS_COMMITS_AHEAD}}'
  # *42 if have stashes.
  vcs+='${${VCS_STATUS_STASHES:#0}:+ %76F*${VCS_STATUS_STASHES}}'
  # 'merge' if the repo is in an unusual state.
  vcs+='${VCS_STATUS_ACTION:+ %196F${VCS_STATUS_ACTION//\%/%%}}'
  # ~42 if have merge conflicts.
  vcs+='${${VCS_STATUS_NUM_CONFLICTED:#0}:+ %196F~${VCS_STATUS_NUM_CONFLICTED}}'
  # +42 if have staged changes.
  vcs+='${${VCS_STATUS_NUM_STAGED:#0}:+ %11F+${VCS_STATUS_NUM_STAGED}}'
  # !42 if have unstaged changes.
  vcs+='${${VCS_STATUS_NUM_UNSTAGED:#0}:+ %11F!${VCS_STATUS_NUM_UNSTAGED}}'
  # ?42 if have untracked files.
  vcs+='${${VCS_STATUS_NUM_UNTRACKED:#0}:+ %12F?${VCS_STATUS_NUM_UNTRACKED}}'
  # If P9K_CONTENT is not empty, leave it unchanged. It's either "loading" or from vcs_info.
  vcs="\${P9K_CONTENT:-$vcs}"

  # Replace P9K git status with our own git formatter
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_CONTENT_EXPANSION=$vcs
  # When Git status is being refreshed asynchronously, display the last known repo status in grey.
  typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION=${${vcs//\%f}//\%<->F}
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  # Enable counters for staged, unstaged, etc.
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  # Show status of repositories of these types. svn and/or hg can be added.
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  # These settings are used for respositories other than Git or when gitstatusd fails and
  # Powerlevel10k has to fall back to using vcs_info.
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=11
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=':'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'%{\b#%}'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'%{\b?%}'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'%{\b!%}'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'%{\b+%}'
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

  # Status indicator
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=9
  typeset -g POWERLEVEL9K_STATUS_ERROR_CONTENT_EXPANSION='${${P9K_CONTENT#SIG}//[!A-Z]}'

  # Command execution time indicator
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0 # Round to seconds
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  # Background jobs indicator
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='⇶'
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=2

  # Context format: user@host, only show when running SSH
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n at %m'
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=244
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=11
  # typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

  # Public IP color.
  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=144

  # Battery indicator
  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=1
  typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND=2
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=3
  typeset -g POWERLEVEL9K_BATTERY_STAGES='\uf58d\uf579\uf57a\uf57b\uf57c\uf57d\uf57e\uf57f\uf580\uf581\uf578'
  typeset -g POWERLEVEL9K_BATTERY_VISUAL_IDENTIFIER_EXPANSION='%0K${P9K_VISUAL_IDENTIFIER}%k'
  typeset -g POWERLEVEL9K_BATTERY_CHARGED_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

  # Current time
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  # Instant Prompt verbose
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # Transient Prompt
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir
}

(( ! p10k_lean_restore_aliases )) || setopt aliases
'builtin' 'unset' 'p10k_lean_restore_aliases'

# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi