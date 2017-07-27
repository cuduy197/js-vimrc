green="\033[32;1;7m"
red="\033[31;1;7m"
yellow="\033[33;1;7m"
end='\033[0m'

printf "${green} Test OK!  \n${end}"

show_spinner()
{
  local -r pid="${1}"
  local -r delay='0.75'
  local spinstr='\|/-'
  local temp
  while ps a | awk '{print $1}' | grep -q "${pid}"; do
    temp="${spinstr#?}"
    printf " [%c]  " "${spinstr}"
    spinstr=${temp}${spinstr%"${temp}"}
    sleep "${delay}"
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

("$@") &
show_spinner "$!"
spinner sleep 10
