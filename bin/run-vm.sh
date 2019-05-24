#!/run/current-system/profile/bin/bash

cd $HOME/VMs

sudo qemu-system-x86_64 \
     -m 10000 \
     -smp 8 \
     -boot d \
     -enable-kvm \
     -net nic \
     -net user \
     -vga none -device qxl-vga,vgamem_mb=32 \
     -soundhw ac97 \
     -hda $IMG
