Vagrant.configure("2") do |config|
  $script = <<-SCRIPT
  sudo dnf install net-tools-2.0-0.52.20160912git.el8.x86_64 -y
  route add default gw 192.168.57.1
  SCRIPT

  config.vm.define "master" do |master|
    master.vm.box = "centos/stream8"
    master.vm.hostname = 'master'
    master.vm.box_url = "centos/stream8"
    master.vm.provision "shell", inline: $script
    master.vm.network :private_network, ip: "192.168.57.4", name: "vboxnet0"

    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "master"]
    end
  end

  config.vm.define "worker0" do |worker0|
    worker0.vm.box = "centos/stream8"
    worker0.vm.hostname = 'worker0'
    worker0.vm.box_url = "centos/stream8"
    worker0.vm.provision "shell", inline: $script
    worker0.vm.network :private_network, ip: "192.168.56.4", name: "vboxnet0"

    worker0.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "master"]
    end
  end
  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "centos/stream8"
    worker1.vm.hostname = 'worker1'
    worker1.vm.box_url = "centos/stream8"
    worker1.vm.provision "shell", inline: $script
    worker1.vm.network :private_network, ip: "192.168.56.5", name: "vboxnet0"

    worker1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "master"]
    end
  end
end