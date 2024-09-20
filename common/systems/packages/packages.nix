{ pkgs, ... }: {
	nixpkgs.config = {
		allowUnfree = true;
		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
	};

	environment.systemPackages = with pkgs; [

	#====Desktop apps==============================#	

	##Audio
		audacity # audio editor/mixer
		puddletag # music file metadata editor
		spotify

	##Books
		calibre # ebub e-reader

	##Communication
		vesktop # Better discord for linux
		discord
		thunderbird # email client
		zoom-us # Video chat client

	##Creativity
		aseprite # Pixel art creation program
		blender # 3D modeling software
		blockbench # Voxel modeling software
		gimp # FOSS Photoshop
		godot_4 # Game development platform
		krita # Drawing program

	##Gaming
		steam
		linuxKernel.packages.linux_zen.xpadneo # Steam controller support
		atlauncher # Modded Minecraft Launcher
		mgba # Game Boy Advance Emulator
		desmume # DSI Emulator
		snes9x # SNES Emulator


	##Productivity
		libreoffice-qt6-still # Libre Office program suite
		mysql-workbench # MySQL editor
		obsidian # Markdown editor
		zed-editor # New text editor
		jetbrains.idea-community # Jetbrains IDEA Community 
		rstudio # R Language IDE
		android-studio # IDE for Android development
		android-studio-tools # Additional tools for Android Studio
	##Tools
		firefox # Web Browser
		gparted # GUI partition manager
		keepassxc # Locally hosted password manager
		mullvad-vpn # VPN client
		pcmanfm # File manager
		pika-backup # Backup manager
		newsflash # RSS feed reader for GNOME
		xorg.xev # Display key presses and codes
		syncthing # File Syncronization tool
		protonmail-desktop # Desktop client for Proton Mail 
		screenkey # Displays key presses on screen
		usbutils # additional tools for cli
		synology-drive-client # Client for synology drive sync
		qemu # Hypervisor program
		virt-manager # Virtual machine manager
		libvirt # Library for virtual machines
		resources # Task manager-esque program 
		gnome-multi-writer # GUI tool for create bootable USBs
		
	##Video
		makemkv # BluRay and DVD ripper
		vlc # Video player
		libbluray # Library to access Blu-Ray disks for playback
		libaacs # Library to access AACS protected Blu-Ray disks
		handbrake # Tool for encoding video files 
		freetube # Youtube program

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
		cliphist # Clipboard history manager for hyprland
		

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
		R
		kotlin
		(python311.withPackages (ps: with ps; [
		    numpy
		    scipy
		    pandas
		    jupyterlab
		    statsmodels
		    scikitlearn
		    matplotlib
		    opencv
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
		(import ./devflake.nix { inherit pkgs; }) 

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
