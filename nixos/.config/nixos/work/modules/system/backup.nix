{ config, pkgs, ...}:
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

systemd.services."borgbackup-sync" = {
  path = [pkgs.bash pkgs.toybox pkgs.rsync];
  serviceConfig = {
     #ExecStart = "${pkgs.bash}/bin/bash /home/yasin/sync_borg_repo.sh";
    ExecStart = "/home/yasin/sync_borg_repo.sh";
    Type = "oneshot";
    User = "root";
  };
};
systemd.timers."borgbackup-sync" = {
    wantedBy = [ "timers.target"];
    timerConfig = {
        OnBootSec = "30m";
        OnUnitActiveSec = "1h";
        Unit = "borgbackup-sync.service";
      };
 };

}
