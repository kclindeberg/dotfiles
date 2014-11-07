#!/bin/sh

cd "$(dirname "$0")"
echo "Installing dotfiles"
IFS='='
for file in \
	git=.config/git \
	vim=.vim
do
	set $file
	src="$PWD/$1"
	dst="$HOME/$2"
	if [ -L "$dst" ]; then
		echo "- $dst: $(readlink $dst)"
	else
		if [ -e "$dst" ]; then
			mv "$dst" "$dst~"
		else
			mkdir -p "${dst%/*}"
		fi
		ln -s "$src" "$dst"
		echo "- $dst --> $src"
	fi
done
