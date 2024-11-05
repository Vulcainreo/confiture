#!/bin/bash

cat /etc/*-release > release.txt; uname -a > uname.txt
lsblk >> lsblk.txt; lshw >> lshw.txt; lsmem >> lsmem.txt; lslocks >> lslocks.txt; lsns >> lsns.txt; lsmod >> lsmod.txt; lscpu >> lscpu.txt
cat /var/log/apt/history.log > update-apt.txt
tar cvf repo.tar.gz /etc/yum*
cat /var/log/dnf.log > update-dnf.txt
getent passwd > passwd.txt
getent group > group.txt
cat /etc/sudoers > sudoers.txt; cat /etc/sudoers.d/* > sudoers2.txt
ps aux | grep ssh > sshd_service.txt; cat /etc/ssh/sshd_config* > sshd.txt
cat /etc/ssh/sshd_config.d/* > sshd2.txt
cat /etc/access.conf >> access.txt
cat /etc/login.defs > logindef.txt; cat /etc/pam.d/* > pam.conf; tar vcf pam.tar.gz /etc/pam.*
dpkg -l >> dpkg.txt; rpm -qa >> dpkg.txt; rpmlist > rpmlist.txt
cat /etc/grub* >> grub.txt
sysctl -a > sysctl-a.txt
sysctl -a > sysctl-a.txt
env > env.txt
cat /etc/shells > shells.txt
find /etc/modprobe.d -type f -exec ls -aiL {} \; -exec cat {} \; > moduleKernel.txt
ls -alLi /etc/shadow > permShadow.txt
mount > mount.txt; cat /etc/fstab > fstab.txt; lsblk > lsblk.txt
cat /etc/cron.d/* > cron.txt
ps faux > ps-faux.txt
find / -type f -perm -004000 -exec ls -ailL {} \; -exec file {} \; > suid.txt
find / -type f -perm -002000 -exec ls -ailL {} \; -exec file {} \; > guid.txt
find / -type d -perm -002 -exec ls -ld {} \; > worldWriteDir.txt
find / -type f -perm -002 -exec ls -ailL {} \; > worldWriteFile.txt
arp -a > arpa.txt; ip a > ipa.txt; route > route.txt
cat /etc/resolv.conf > resolv.txt; cat /etc/hosts > hosts.txt
netstat -lnutpa > netstat.txt
iptables -L -v -n > iptables.txt
firewall-cmd --list-all > firewalld.txt; nft list ruleset > nftables.txt
cat /etc/syslog-ng/syslog-ng.conf > syslog-ng.txt; cat /etc/rsyslog.conf > rsyslog.txt; cat /etc/rsyslog.d/* > rsyslog2.txt
tar cvf logrotate.tar.gz /var/logrotate*
cat /etc/ntp.conf > ntp.txt; cat /etc/chrony.conf > chrony.txt
find /var/log -type f -exec ls -ailL {} \; > varLog.txt
cat /etc/snmp/snmpd.conf
usbguard list-devices > usbguard_listdevices.txt
cat /etc/sestatus.conf >> selinux.txt; getenforce >> selinux.txt
