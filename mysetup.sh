apt-get update
apt-get install -y ansible
mkdir /home/vagrant/ansible
cd /home/vagrant/ansible
cp /vagrant/play.yaml .
ansible-playbook play.yaml
sudo cp -r /vagrant/jenkins /var/lib
sudo chown jenkins -R /var/lib/jenkins
mkdir /home/vagrant/build2job
cp /vagrant/build.xml /home/vagrant/build2job
cp /vagrant/checkstyle-8.29-all.jar /home/vagrant/build2job
cp /vagrant/sun_checks.xml /home/vagrant/build2job
sudo chmod 777 -R /home/vagrant/build2job
sudo service jenkins restart
