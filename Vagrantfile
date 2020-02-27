Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
    config.vm.define "devops2" do |devops2|
    end
config.vm.provision :shell, path: "mysetup.sh"
config.vm.network "public_network"
end
