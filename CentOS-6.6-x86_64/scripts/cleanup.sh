#!/bin/sh

# Remove Linux headers
yum -y remove gcc kernel-devel kernel-headers perl perl-Module-Pluggable perl-Pod-Escapes perl-Pod-Simple perl-libs perl-version

yum -y clean all

# Remove Virtualbox specific files
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version

# Cleanup log files
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
rm -rf /tmp/*

rm -f /etc/udev/rules.d/70-persistent-net.rules
sed -i '/^UUID/d'   /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0

dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
