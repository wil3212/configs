runtime! archlinux.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next

" line enables syntax highlighting by default.

if has ("syntax")
  syntax on
endif



" If using a dark background within the editing area and syntax highlighting

" turn on this option as well

set background=dark



" The following are commented out as they cause vim to behave a lot

" differently from regular Vi. They are highly recommended though.

"set showcmd " Show (partial) command in status line.

set showmatch " Show matching brackets.

"set ignorecase " Do case insensitive matching

"set smartcase " Do smart case matching

"set incsearch " Incremental search

"set autowrite " Automatically save before commands like :next and :make

"set hidden " Hide buffers when they are abandoned

set mouse=a " Enable mouse usage (all modes)




set nu

set ai

set tabstop=4

set ls=2

set number

set relativenumber


:set virtualedit=all



set hlsearch






