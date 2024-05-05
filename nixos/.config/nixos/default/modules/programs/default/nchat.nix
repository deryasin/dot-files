{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    (nchat.overrideAttrs (oldAttrs: {
      cmakeFlags = [
            "-DHAS_WHATSAPP=ON" # go module build required
      ];
    }))
  ];
}

