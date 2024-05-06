self: super: {
        eww = super.eww.overrideAttrs (oldAttrs: rec {
            pname = "eww"; 
            version = "0.6.0";
            src = super.fetchFromGitHub {
              owner = "elkowar";
              repo = "eww";
              rev = "v0.6.0";
              sha256 = "sha256-rzDnplFJNiHe+XbxbhZMEhPJMiJsmdVqtZxlxhzzpTk=";
            };
            buildInputs = oldAttrs.buildInputs ++ [self.libdbusmenu self.libdbusmenu-gtk3];
            cargoDeps = oldAttrs.cargoDeps.overrideAttrs (super.lib.const {
              name = "${pname}-vendor.tar.gz";
              inherit src;
              outputHash = "sha256-1UBkM8MLL80c1+J5GHRtymOjhmkxxDZM2v03Ud0FBMs=";
            });
        });
    }
