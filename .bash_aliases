alias listusers='sudo arp-scan --interface=wlo1 --localnet'
alias ll='ls --color=always -rthla'
alias anonme='sudo ./anonme.sh'
alias c='xclip'
alias v='xclip -o'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias bbt="pushd ~/Desktop/workspace/BugBountyTools"
alias work="pushd ~/Desktop/workspace/GitRepos"
alias burp="java -jar ~/Downloads/burpSuitePro/burploader.jar > /dev/null 2>&1 &"
alias ctf="pushd ~/Desktop/CTFs"
alias ptlab="pusd ~/Desktop/PT-LAB"
