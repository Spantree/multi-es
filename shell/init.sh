wget https://apt.puppetlabs.com/puppetlabs-release-saucy.deb
dpkg -i puppetlabs-release-saucy.deb 
apt-get update
apt-get install -y puppet=3.4.3-1puppetlabs1 git librarian-puppet
gem install rgen
cd /etc/puppet
librarian-puppet update
