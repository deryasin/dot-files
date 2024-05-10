{ pkgs, ... }:
{
environment.systemPackages = with pkgs; [
   (python3.withPackages(ps: with ps; [ wheel setuptools pip pygobject3 gst-python dbus-python psutil line_profiler discordpy watchdog pillow yt-dlp material-color-utilities jinja2]))
  ];
}

