#!/usr/bin/env bash
wrapper() {
  RED="\033[0;31m"
  GREEN="\033[0;32m"
  YELLOW="\033[0;33m"
  BLUE="\033[0;36m"
  NORMAL="\033[0m"

  REPO_HTTPS="https://github.com/cuduy197/js-vimrc.git"
  VUNDLE_HTTPS="https://github.com/VundleVim/Vundle.vim.git"

echo "${BLUE}"
cat << "HELLO_TEXT"
       __       _______.     ____    ____  __  .___  ___.                   
      |  |     /       |     \   \  /   / |  | |   \/   |                   
      |  |    |   (----` _____\   \/   /  |  | |  \  /  |                   
.--.  |  |     \   \    |______\      /   |  | |  |\/|  |                   
|  `--'  | .----)   |           \    /    |  | |  |  |  |                   
 \______/  |_______/             \__/     |__| |__|  |__|                   
                                                                            
  ______  __    __   _______   __    __  ____    ____  __    ___    ______  
 /      ||  |  |  | |       \ |  |  |  | \   \  /   / /_ |  / _ \  |____  | 
|  ,----'|  |  |  | |  .--.  ||  |  |  |  \   \/   /   | | | (_) |     / /  
|  |     |  |  |  | |  |  |  ||  |  |  |   \_    _/    | |  \__, |    / /   
|  `----.|  `--'  | |  '--'  ||  `--'  |     |  |      | |    / /    / /    
 \______| \______/  |_______/  \______/      |__|      |_|   /_/    /_/     
                                                                             
HELLO_TEXT
echo "${NORMAL}"

  if [ ! -n "$VIM" ]; then
    VIM=~/.vim
  fi

  if [ -d "$VIM" ]; then
    printf "${YELLOW}%s${NORMAL}\n" "Bạn chưa tạo thư mục $VIM ."
    printf "${YELLOW}%s${NORMAL}\n" "Xóa thư mục $VIM khi cài đặt lại."
    exit 0
  fi

  # Prevent the cloned repository from having insecure permissions. Failing to do
  # so causes compinit() calls to fail with "command not found: compdef" errors
  # for users with insecure umasks (e.g., "002", allowing group writability). Note
  # that this will be ignored under Cygwin by default, as Windows ACLs take
  # precedence over umasks except for filesystems mounted with option "noacl".
  umask g-w,o-w

  printf "${BLUE}%s${NORMAL}\n" "Sao chép vimrc từ repo:  ${REPO_HTTPS}"

  hash git >/dev/null 2>&1 || {
    printf "${RED}%s${NORMAL}\n" "Error: git chưa được cài đặt"
    exit 1
  }

  env git clone --depth=1 $REPO_HTTPS $VIM || {
    printf "${RED}%s${NORMAL}\n" "Lỗi khi clone repo!."
    exit 1
  }

  printf "${BLUE}%s${NORMAL}\n" "Tìm kiếm file cấu hình vim ..."
  if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    printf "${YELLOW}%s${NORMAL}\n" "Tìm thấy ~/.vimrc."
    printf "${BLUE}%s${NORMAL}\n" "Sao lưu ~/.vimrc thành $VIM/vimrc.bak"
    mv ~/.vimrc $VIM/vimrc.bak
  fi

  printf "${BLUE}%s${NORMAL}\n" "Tạo lối tắt $VIM/vimrc địa chỉ ~/.vimrc..."
  ln -fs $VIM/vimrc ~/.vimrc

  if [ ! -d "$VIM/bundle/Vundle.vim" ]; then
      printf "${BLUE}%s${NORMAL}\n" "Yahoooo! cài đặt Vundle..."
      env git clone --depth=1 $VUNDLE_HTTPS "$VIM/bundle/Vundle.vim"
  fi

  if [ ! -f $VIM/colors/wombat256mod.vim ]; then
      if [ ! -d $VIM/colors/ ]; then
          mkdir -p $VIM/colors
      fi
      wget 'http://www.vim.org/scripts/download_script.php?src_id=13400' -O $VIM/colors/wombat256mod.vim
  fi

  printf "${GREEN}%s${NORMAL}\n" "Vimrc đã được cấu hình ;)"
  printf "${YELLOW}%s${NORMAL}\n" "Hãy đợi vim cài đặt các plugin sau đó , khởi động lại vim ."
  printf "${BLUE}%s${NORMAL}\n" "Chúc bạn 1 ngày tốt lành :D "
}

wrapper
vim +PluginInstall
