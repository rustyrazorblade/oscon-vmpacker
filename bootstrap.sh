# change root pw
# run as root
apt-get install openssh-server

# ssh in as demo/demo
sudo ssh-keygen -t rsa
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC50yEv1EPEJIHmb9NX0hnLNNftv3C5Vavot6jauHGlIedYbgaJpNBzR7YQO3kWpQFNEwXj+xZzeUMV1yAg1z2qLncEK6JBu/RCVq5QNFY9O1GeQziDMCCup2NpWhcN8aR/HXGgmXteeQrVeIDqgl3sLZlG7wFB4vVC/FaQmKrnAB7i2pXuGlTNW6IN3PeEtP6ge5ZBVC+IW6bVuCrYUQWPkMMzF2c/VQF/kgwBu5XbSL8XqG0hvdsXgPbFrLyNThN1d/i0DyfaJI5HH0Iy8d8yIRMQta4BOUtkPlJpeoHBcHVE0FpeXMzmcOVgb+mdRR5bAuVvSE22jIdDq8L1jFH7 jhaddad@jhaddad-rmbp15.local" | sudo tee /root/.ssh/authorized_keys2
sudo chmod 600 /root/.ssh/authorized_keys2
# exit and log in as root

ssh -i id_rsa root@localhost -p 2222
apt-get update
apt-get install -y vim linux-headers-$(uname -r) build-essential dkms openjdk-7-jre

echo "ls -lAhG" >> /etc/bash.bashrc

gpg --keyserver pgp.mit.edu --recv-keys F758CE318D77295D
gpg --export --armor F758CE318D77295D | sudo apt-key add -

gpg --keyserver pgp.mit.edu --recv-keys 2B5C1B00
gpg --export --armor 2B5C1B00 | sudo apt-key add -

gpg --keyserver pgp.mit.edu --recv-keys 0353B12C
gpg --export --armor 0353B12C | sudo apt-key add -

apt-get upgrade

# permit root login in /etc/ssh/sshd_config

# export                    <machines> --output|-o <name>.<ovf/ova>
#                            [--legacy09|--ovf09|--ovf10|--ovf20]
#                            [--manifest]
#                            [--iso]
#                            [--options manifest|iso|nomacs|nomacsbutnat]
#                            [--vsys <number of virtual system>]
#                                    [--product <product name>]
#                                    [--producturl <product url>]
#                                    [--vendor <vendor name>]
#                                    [--vendorurl <vendor url>]
#                                    [--version <version info>]
#                                    [--description <description info>]
#                                    [--eula <license text>]
#                                    [--eulafile <filename>]
#

VBoxManage export Ubuntu14 -o base14.ova --ovf20
