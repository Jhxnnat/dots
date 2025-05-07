
# set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_insert block

alias neofetch="fastfetch -c ~/Dev/terceros/neofetch.jsonc"
alias n="nvim"

function fish_greeting
	random choice "Hola" "Haloou" "Fedora btw" "When ReD?" "175 = 300"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo ' '
    case insert
      set_color --bold green
      echo 'i '
    case replace_one
      set_color --bold green
      echo 'r '
    case visual
      set_color --bold brmagenta
      echo 'v '
    case '*'
      set_color --bold red
      echo '? '
  end
  set_color normal
end

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"$last_status! "(set_color normal)
    end

    string join '' -- (set_color green) (prompt_pwd) (set_color normal) (fish_git_prompt)' ' $stat ' > '
end

function fish_right_prompt
	echo (date '+%H:%M')
end
