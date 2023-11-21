{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    (rofi.override {
      plugins = [pkgs.rofi-emoji];
    })
  ];
}
