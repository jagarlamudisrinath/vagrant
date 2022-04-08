Vagrant.configure("2") do |config|
  $script = <<-SCRIPT
  sudo dnf install net-tools-2.0-0.52.20160912git.el8.x86_64 -y
  cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
  route add default gw 192.168.57.1
  SCRIPT
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
  $script0 = <<-SCRIPT
  sudo dnf install net-tools-2.0-0.52.20160912git.el8.x86_64 -y
  cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
  route add default gw 192.168.56.1
  SCRIPT
  config.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.define "master" do |master|
    master.vm.box = "centos/stream8"
    master.vm.hostname = 'kmaster'
    master.vm.box_url = "centos/stream8"
    master.vm.provision "shell", inline: $script, run: "always"
    master.vm.network :private_network, ip: "192.168.57.4", name: "vboxnet0"

    master.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "master"]
    end
  end

  config.vm.define "worker0" do |worker0|
    worker0.vm.box = "centos/stream8"
    worker0.vm.hostname = 'kworker0'
    worker0.vm.box_url = "centos/stream8"
    worker0.vm.provision "shell", inline: $script0,  run: "always"
    worker0.vm.network :private_network, ip: "192.168.56.4", name: "vboxnet1"

    worker0.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "worker0"]
    end
  end

  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "centos/stream8"
    worker1.vm.hostname = 'kworker1'
    worker1.vm.box_url = "centos/stream8"
    worker1.vm.provision "shell", inline: $script0,  run: "always"
    worker1.vm.network :private_network, ip: "192.168.56.5", name: "vboxnet1"

    worker1.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
      v.customize ["modifyvm", :id, "--name", "worker1"]
    end
  end
end
