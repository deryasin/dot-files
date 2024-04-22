{ config, ...}:
{
  services.borgbackup.jobs.full = {
    paths = [ 
      "/home/"
      "/var/lib/"
      ];
    exclude = [
      "/home/yasin/.cache/appimage-run/"
      "/var/lib/systemd"
    ];
    repo = "/borg-local";
    encryption = {
      mode = "repokey";
      passCommand = "cat /root/.borg-passphrase";
    };
    compression = "auto,lzma";
  };
systemd.timers."borgbackup-job-full" = {
    wantedBy = [ "timers.target"];
    timerConfig= {
      OnBootSec = "5m";
      OnUnitActiveSec = "1h";
      Unit = "borgbackup-job-full.service";
      };
    };
}
