let
  my-python-packages = ps: with ps; [
    pandas
    requests
    gi
    # other python packages
  ];
in
environment.systemPackages = [
  (pkgs.python3.withPackages my-python-packages)
];

