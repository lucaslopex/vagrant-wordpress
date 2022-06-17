sudo apt update
#Dependencias Wordpress
sudo apt install apache2 ghostscript libapache2-mod-php mysql-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip
#Diretorio Wordpress
sudo mkdir -p /opt/www
sudo chown www-data: /opt/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /opt/www
#Configuracao apache
cp /vagrant/archive/wordpress.conf /etc/apache2/sites-available/wordpress.conf
#Parametros apache
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo service apache2 reload