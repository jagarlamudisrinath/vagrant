Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provider "virtualbox" do |master|
    config.vm.hostname = "master"
    master.memory = 1024
    master.cpus = 1
  end
end
