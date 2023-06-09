# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")];
  
  boot.initrd.luks.devices.luksroot = {
    device = "/dev/disk/by-label/cryptroot";
    preLVM = true;
    allowDiscards = true;
  };   

  boot.initrd.availableKernelModules =
  [
    "xhci_pci"
    "ahci"
    "usbhid"
    "sd_mod"
    "dm_mod"
    "dm_crypt"
    "cryptd"
    "input_leds"
  ]
  ++ config.boot.initrd.luks.cryptoModules;
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems = { 
    "/" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/home" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@home" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/nix" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@nix" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/tmp" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@tmp" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/var" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@var" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };
    
    "/var/log" = { 
      device = "/dev/disk/by-label/cryptroot";
      fsType = "btrfs";
      options = [ 
        "subvol=@log" 
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
