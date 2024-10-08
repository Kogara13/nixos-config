{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
	};

	environment.systemPackages = with pkgs; 
	let 
	    RStudio-with-my-packages = rstudioWrapper.override{
		packages = with rPackages; [ 
		    dplyr 
		    ggplot2 
		    hash 
		    tidyverse 
		    fastDummies 
		    devtools 
		    forecast 
		    treemapify
		    Hmisc
		    corrgram
		    gains
		    ROCR
		    caret
		]; 
	    };
	in
	[

	#====Desktop apps==============================#	

	##Audio
		audacity # audio editor/mixer
		puddletag # music file metadata editor
		spotify

	##Books
		calibre # ebub e-reader

	##Communication
		#discord
		vesktop
		discord
		thunderbird # email client
		zoom-us # zoom chat

	##Creativity
		aseprite # Pixel art creation tool
		blender # 3D modeling software
		blockbench # Voxel modeling software
		gimp # FOSS Photoshop
		godot_4 # Game development platform
		krita # Drawing program

	##Gaming
		# polymc # open source Minecraft launcher
		steam
		tetrio-desktop
		linuxKernel.packages.linux_zen.xpadneo
		atlauncher # Minecraft Launcher
		mgba
		desmume
		snes9x
		pokemmo-installer


	##Productivity
		libreoffice-qt6-still
		mysql-workbench # MySQL editor
		mysql84
		obsidian # Markdown editor
		jetbrains.idea-community
		android-studio
		android-studio-tools 
	##Tools
		brave # Web browser
		firefox
		gparted # GUI partition manager
		keepassxc # Locally hosted password manager
		mullvad-vpn # VPN client
		pcmanfm # File manager
		pika-backup # Backup manager
		newsflash # RSS feed reader for GNOME
		xorg.xev # Display key presses and codes
		syncthing
		protonmail-desktop
		screenkey 
		usbutils # additional tools for cli
		synology-drive-client 
		qemu
		virt-manager
		libvirt
		resources # Task manager-esque 
		gnome-multi-writer
		(vivaldi.overrideAttrs
		    (oldAttrs: {
			dontWrapQtApps = false;
			dontPatchELF = true;
			nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
		    }))
		
	##Video
		makemkv # BluRay and DVD ripper
		vlc # Video player
		libbluray # Library to access Blu-Ray disks for playback
		libaacs # Library to access AACS protected Blu-Ray disks
		handbrake # Tool for encoding video files 
		freetube

	#====Hyprland=======================================#

		hyprland
		dolphin # File Manager
		dunst # notification daemon for hyprland 
		libnotify # dependency for dunst
		rofi-wayland # program search
		swww # wallpaper manager
		waybar # taskbar for hyprland
		xdg-desktop-portal-hyprland
		wev # wayland xev
		wl-clipboard
		cliphist

	#====GNOME Extensions==============================#

		

	#====CLI Programs==================================#

	## Terminal
		kitty # Terminal emulator
		nix-index # A files database for nixpkgs
		zsh # Terminal shell
		starship # Makes zsh look nice
		zplug # zsh plugins
		fzf # fuzzy finder
		zoxide # powerful cd
		kanata # keyboard remapper (for using esc in vim)
		tmux
		lsd
		cool-retro-term
	##Productivity
		bluez # bluetooth manager
		bluez-tools # Additional tools to manage bluetooth devices
		btop # TUI system monitor
		git # Version control manager
		lazygit # TUI for git commands
		neovim # best editor
		openssl # Library for SSL and TLD protocols
		ranger # TUI file manager
		unzip # Zip file extracter
		vim # better editor
		wget # File retrieval for HTTP/S, FTP
		yt-dlp # CLI for downloading youtube videos
		zip # File compressor/archiver
	
	## Coding
		gcc # GNU compiler
		nodejs # Javascript framework
		python3 # Python programming language
		rustc # Rust 
		cargo
		go
		cmake
		RStudio-with-my-packages
		kotlin
		(python311.withPackages (ps: with ps; [
		    numpy
		    scipy
		    pandas
		    jupyterlab
		    statsmodels
		    scikitlearn
		    matplotlib
		    opencv4
		]))

	## Daemons
		mpv # music daemon

	## Fun packages
		cava # Audio visualizer
		cbonsai # For people who kill real plants
		cmatrix # RAM Eater 3000
		cowsay # Don't have a cow, man!
		figlet # Big words!
		fortune-kind # Kind words of wisdom
		lolcat # TASTE THE RAINBOW MOTHA FUCKA
		#neofetch # System info display
		fastfetch
		pfetch # Neofetch Jr.
		pipes # A series of tubes
		pokemonsay # Pokemon!
		pokemon-colorscripts-mac

	## Home Manager
		home-manager

	#====Custom Packages=======================================#	
		#(import ./devflake.nix { inherit pkgs; }) 
		# Example of creating custom package from .nix file

	];

	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts
		noto-fonts-emoji
		twemoji-color-font
		font-awesome
		powerline-fonts
		powerline-symbols
		corefonts
		(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
	];
        
}
