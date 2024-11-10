# system/default.nix
{
  time.timeZone = "Europe/Berlin";
  services.envfs.enable = true;
  i18n = {
    consoleKeyMap = "de";
    defaultLocale = "de_DE.UTF-8";
  };
}

