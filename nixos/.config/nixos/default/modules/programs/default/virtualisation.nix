{ config, pkgs, ...}:
{
  virtualisation = {
    waydroid = {
        enable = true;
      };
    docker = { 
      enable = true;   
    };
    libvirtd = {
      enable = true;
      qemuSwtpm = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
        swtpm.enable = true;
        runAsRoot = false;
      };
    };
   };
environment.sessionVariables.LIBVIRT_DEFAULT_URI = [ "qemu:///system" ];
  environment.systemPackages = with pkgs; [ virt-manager win-virtio swtpm];
}

