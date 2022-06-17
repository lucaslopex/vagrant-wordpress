$script_install_wordpress = <<-SCRIPT
sudo apt update -y && \
#Dependencias Wordpress
sudo apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip -y && \
#Diretorio Wordpress
sudo mkdir -p /opt/www && \
sudo chown www-data: /opt/www && \
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /opt/www && \
#Configuracao apache
sudo cp /vagrant/archive/wordpress.conf /etc/apache2/sites-available/wordpress.conf && \
#Parametros apache
sudo a2ensite wordpress && \
sudo a2enmod rewrite && \
sudo a2dissite 000-default && \
sudo service apache2 reload
SCRIPT

$script_create_db = <<-SCRIPT
mysql -e "create database wordpress;" &&
mysql -e "create user wordpress@localhost identified by 'Word@321#BD';" &&
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';"
SCRIPT

$script_bd_wordpress = <<-SCRIPT
sudo -u www-data cp /opt/www/wordpress/wp-config-sample.php /opt/www/wordpress/wp-config.php && \
#alteracao de nome e senha de banco
sudo -u www-data sed -i 's/database_name_here/wordpress/' /opt/www/wordpress/wp-config.php && \
sudo -u www-data sed -i 's/username_here/wordpressy/' /opt/www/wordpress/wp-config.php && \
sudo -u www-data sed -i 's/password_here/Word@321#BD/' /opt/www/wordpress/wp-config.php
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    
    config.vm.define "srvword" do |srvword|
        #IP da rede externa
        srvword.vm.network "public_network", ip: "10.0.17.70"
        #Instalacao do certificado
        #srvword.vm.provision "shell", inline: "cat /archive/ubuntu.pub >> .ssh/authorized_keys"
        #Rodar script da instalação do wordpress
        srvword.vm.provision "shell", inline: $script_install_wordpress
        srvword.vm.provision "shell", inline: $script_create_db
        srvword.vm.provision "shell", inline: $script_bd_wordpress
        
        #Liberacao de portas
        srvword.vm.network "forwarded_port", guest: 80, host: 80
        srvword.vm.network "forwarded_port", guest: 443, host: 443
    end    
end