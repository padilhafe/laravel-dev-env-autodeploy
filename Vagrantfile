machines = {
  "nms-app-vm" => {"memory" => "2048", "cpu" => "4", "ip" => "192.168.10.254", "image" => "bento/ubuntu-22.04"},
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "public_network", ip: conf["ip"]
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]        
      end
      machine.vm.provision "shell", path: "provision.sh" 
      machine.vm.provision "file", source: "./docker-compose.yml", destination: "/home/vagrant/projeto-nms/docker-compose.yml"
      machine.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/projeto-nms/docker-compose.yml" 

      machine.vm.provision "file", source: "./Dockerfile", destination: "/home/vagrant/projeto-nms/Dockerfile"
      machine.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/projeto-nms/Dockerfile" 

      machine.vm.provision "file", source: "./env", destination: "/home/vagrant/projeto-nms/.env"
      machine.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/projeto-nms/.env" 

      machine.vm.provision "file", source: "./nms-nginx.conf", destination: "/home/vagrant/projeto-nms/docker-compose/nginx/nms-nginx.conf"
      machine.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/projeto-nms/docker-compose/nginx/nms-nginx.conf" 

      machine.vm.provision "file", source: "./init_db.sql", destination: "/home/vagrant/projeto-nms/docker-compose/mysql/init_db.sql"
      machine.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/projeto-nms/docker-compose/mysql/init_db.sql" 
    end
  end
end