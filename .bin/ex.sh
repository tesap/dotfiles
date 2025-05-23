if [ -f "$1" ]; then
	NAME=${1%.*}
	case "$1" in
	*.tar.bz2) tar xvjf ./"$1" ;;
	*.tar.gz) tar xvzf ./"$1" ;;
	*.tar.zst) tar --use-compress-program=unzstd -xvf ./"$1" ;;
	*.tar.xz) tar xvJf ./"$1" ;;
	*.lzma) unlzma ./"$1" ;;
	*.bz2) bunzip2 ./"$1" ;;
	*.rar) unrar x -ad ./"$1" ;;
	*.gz) gunzip ./"$1" ;;
	*.tar) tar xvf ./"$1" ;;
	*.tbz2) tar xvjf ./"$1" ;;
	*.tgz) tar xvzf ./"$1" ;;
	*.zip) unzip ./"$1" ;;
	*.Z) uncompress ./"$1" ;;
	*.7z) 7z x ./"$1" ;;
	*.xz) unxz ./"$1" ;;
	*.exe) cabextract ./"$1" ;;
	*) echo "ex: '$1' - Unknown file" ;;
	esac
fi
