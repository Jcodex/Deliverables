apt-get update
apt-get install -y ansible
mkdir /home/vagrant/ansible
cd /home/vagrant/ansible
cp /vagrant/play.yaml .
ansible-playbook play.yaml
sudo cp -r /vagrant/jenkins/jobs /var/lib/jenkins
sudo service jenkins restart