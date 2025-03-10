{
  imports =
    [ 
      ../../common/systems/configuration.nix
      ./hardware-configuration.nix
      #./packages/packages.nix
      ./modules/bundle.nix
    ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking = {
    hostName = "desktop";
    interfaces.eth0.ipv4.addresses = [ { 
        address = "192.168.1.75";
        prefixLength =24;
    }];
    defaultGateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" ];
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";




  # Set your time zone.
  ##time.timeZone = "America/New_York";
  # Set time and date to local to work with dual boot
  ##time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  ##i18n.defaultLocale = "en_US.UTF-8";
  ##i18n.extraLocaleSettings = {
    ##LC_ADDRESS = "en_US.UTF-8";
    ##LC_IDENTIFICATION = "en_US.UTF-8";
    ##LC_MEASUREMENT = "en_US.UTF-8";
    ##LC_MONETARY = "en_US.UTF-8";
    ##LC_NAME = "en_US.UTF-8";
    ##LC_NUMERIC = "en_US.UTF-8";
    ##LC_PAPER = "en_US.UTF-8";
    ##LC_TELEPHONE = "en_US.UTF-8";
    ##LC_TIME = "en_US.UTF-8";
  ##};

  ##nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Automatically delete config versions older than 30 days
  ##nix.gc = {
	##automatic = true;
	##dates = "daily";
	##options = "--delete-older-than 7d";
  ##};

  #xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable CUPS to print documents.
  ##services.printing.enable = true;

  #Add ~/.local/bin to PATH
  ##environment.localBinInPath = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
