{ config, pkgs, lib, ... }:
{

nixpkgs.overlays = [
  (
    final: prev: {
    logseq = prev.logseq.overrideAttrs (oldAttrs: {
      postFixup = ''
        makeWrapper ${prev.electron_27}/bin/electron $out/bin/${oldAttrs.pname} \
          --add-flags $out/share/${oldAttrs.pname}/resources/app \
          --add-flags "--use-gl=desktop" \
          --prefix LD_LIBRARY_PATH : "${prev.lib.makeLibraryPath [prev.stdenv.cc.cc.lib]}"
      '';
    });
  )
]
