Vagrant.configure("2") do |config|
  config.ssh.insert_key = true

  config.vm.define "backend" do |backend|
    backend.vm.box = "ubuntu/focal64" 
    backend.vm.network "private_network", ip: "192.168.101.20"
    backend.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
      vb.memory = "1024"
    end
    backend.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      
    SHELL
    backend.vm.provision "file", source: "./provision_backend.sh", destination: "/tmp/provision_backend.sh"
    backend.vm.provision "shell", inline: "sudo chmod +x /tmp/provision_backend.sh && sudo bash /tmp/provision_backend.sh"
  end
  
  config.vm.define "database" do |database|
    database.vm.box = "ubuntu/focal64" 
    database.vm.network "private_network", ip: "192.168.101.30"
    database.vm.provider "virtualbox" do |vb|
      vb.cpus = 1
      vb.memory = "1024"
    end
    database.vm.provision "shell", inline: <<-SHELL
  
    SHELL
    database.vm.provision "file", source: "./provision_database.sh", destination: "/tmp/provision_database.sh"
    database.vm.provision "shell", inline: "sudo chmod +x /tmp/provision_database.sh && sudo bash /tmp/provision_database.sh"
  end
end