
self:
let
  enableWayland = drv: bin: drv.overrideAttrs (
    old: {
      nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ self.makeWrapper ];
      postFixup = (old.postFixup or "") + ''
        wrapProgram $out/bin/${bin} \
          --add-flags "--enable-features=UseOzonePlatform" \
          --add-flags "--ozone-platform=wayland" \
          --add-flags "--enable-features=WebRTCPipeWireCapturer"
      '';
    }
  );
in
super:
  {
    ferdium = enableWayland super.ferdium "ferdium";
    discord = enableWayland super.discord "discord";
    vscode = enableWayland super.vscode "code";
    logseq = enableWayland super.logseq "logseq";

  }
