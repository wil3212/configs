# configs
Config set for things like sway nvim waybar foot...

The philosophy of this repo is very straight forward: folder names is where stuff should be droped, .config holds stuff to drop onto ~/.config, etc holds stuff to drop onto /etc.

# Got configs for:
	1. nvim
	2. vim
	3. foot
	4. starship
	5. sway
	6. waybar 
	7. glpaper (shader wallpaper thing)
	
# .builds holds glpaper
For glpaper:
	Do `makepkg -sie` as it is a fixed package (later one need to do a diff in order not to share the src folder)
	
	
# pkglists:
       To install all the pkgs, do `sudo pacman -S --needed - < pkglist.txt`

