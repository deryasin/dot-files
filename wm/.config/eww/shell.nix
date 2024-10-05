{ nixpkgs ? import <nixpkgs> {}}:
(nixpkgs.runCommand "python-with-gtk" {
    buildInputs = [ nixpkgs.gtk3 ];
    nativeBuildInputs = [ nixpkgs.gobject-introspection nixpkgs.wrapGAppsHook ];
  } ''
  mkdir -p $out/bin
  cp ${nixpkgs.python3.withPackages (p: [p.pygobject3])}/bin/python $out/bin/python-with-gtk
  wrapGAppsHook
'')
