set fish_cursor_insert block
set -U fish_prompt_pwd_dir_length 0

alias n="nvim"
alias hx="helix"
# alias fastfetch="fastfetch -l PearOS"

function fish_greeting
	random choice "42" "When Music?" "175 = 300" "Rewrite ReD" "make malloc" "yshell"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)" ($last_status)" (set_color normal)
    end

    string join '' -- (set_color --bold green) (prompt_pwd) (set_color normal) (fish_git_prompt) $stat ' > '
end
