{ config, pkgs, lib, ...}:

{
  networking = {
    # dns
    networkmanager = {
      enable = true;
      unmanaged = ["docker0" "rndis0"];
      wifi.macAddress = "random";
    };
    firewall = {
      enable = true;
      # if your minecraft server is not worky
      # this is probably why
      allowedTCPPorts = [443 80 22 7000 8080 5432];
      allowedUDPPorts = [443 80 44857 8080];
      allowPing = false;
      logReversePathDrops = true;
    };
  };

  services.mullvad-vpn = {
    enable = true;
    enableExcludeWrapper = false;
    package = pkgs.mullvad-vpn;
  };

  # slows down boot time
  systemd.services.NetworkManager-wait-online.enable = false;
}
