Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    
    config.vm.define "srvword" do |srvword|
     #IP da rede externa
     srvword.vm.network "public_network", ip: "10.0.17.70"
     #Instalacao do certificado
     #srvword.vm.provision "shell", inline: "cat /vagrant/archive/ubuntu.pub >> .ssh/authorized_keys"
     #Rodar script da instalação do docker
     srvword.vm.provision "shell", inline: $script_echodocker
     srvword.vm.provision "shell", inline: $script_gpgdocker
     srvword.vm.provision "shell", inline: $script_docker
     srvword.vm.provision "shell", inline: $script_build_nginx
    #Liberacao de portas
     srvword.vm.network "forwarded_port", guest: 80, host: 80
     srvword.vm.network "forwarded_port", guest: 81, host: 81
     srvword.vm.network "forwarded_port", guest: 443, host: 443
    end