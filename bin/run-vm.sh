#!/run/current-system/profile/bin/bash

cd $HOME/VMs

sudo qemu-system-x86_64 \
     -m 6000 \
     -smp 6 \
     -boot d \
     -enable-kvm \
     -net nic \
     -net user \
     -soundhw ac97 \
     -hda $IMG
