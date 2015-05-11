Vagrant.configure(2) do |config|
    config.vm.box = "chef/debian-7.6"
    config.vm.hostname = 'phpbox'

    config.vm.network :private_network, ip: '192.168.33.10'
    config.vm.network :forwarded_port, guest: 80, host: 8080
    config.vm.network :forwarded_port, guest: 5432, host: 5432
    config.vm.network :forwarded_port, guest: 3306, host: 3306

    #config.vm.synced_folder ".", "/var/www", type: "nfs"
    config.vm.synced_folder ".", "/var/www", owner: "www-data", group: "www-data"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    config.vm.provision "shell", inline: "yes | sudo aptitude update"
    config.vm.provision "shell", inline: "yes | sudo aptitude install vim build-essential"

    #required by libxpm
    #config.vm.provision "shell", inline: "yes | sudo aptitude install libx11-dev"

    #required by mcrypt
    config.vm.provision "shell", inline: "yes | sudo aptitude install libltdl-dev"

    #required by imap
    config.vm.provision "shell", inline: "yes | sudo aptitude install libpam0g-dev"

    #required by php curl
    config.vm.provision "shell", inline: "yes | sudo aptitude install libcurl4-gnutls-dev"

    #required by phpize
    config.vm.provision "shell", inline: "yes | sudo aptitude install autoconf"

    #required by mysql
    config.vm.provision "shell", inline: "yes | sudo aptitude install libaio1 libaio-dev"

    config.vm.provision "shell", path: "recipes/libxml.sh"
    #config.vm.provision "shell", path: "recipes/curl.sh"
    config.vm.provision "shell", path: "recipes/openssl.sh"
    config.vm.provision "shell", path: "recipes/zlib.sh"
    config.vm.provision "shell", path: "recipes/ncurses.sh"
    config.vm.provision "shell", path: "recipes/pkgconfig.sh"
    #config.vm.provision "shell", path: "recipes/libxpm.sh"
    config.vm.provision "shell", path: "recipes/xstl.sh"
    config.vm.provision "shell", path: "recipes/jpeg.sh"
    config.vm.provision "shell", path: "recipes/freetype.sh"
    config.vm.provision "shell", path: "recipes/libpng.sh"
    config.vm.provision "shell", path: "recipes/mcrypt.sh"
    config.vm.provision "shell", path: "recipes/ioncube.sh"
    config.vm.provision "shell", path: "recipes/pcre.sh"
    config.vm.provision "shell", path: "recipes/imap.sh"
    config.vm.provision "shell", path: "recipes/icu.sh"
    config.vm.provision "shell", path: "recipes/komodo.sh"
    #freetds
    #instant client

    #databases
    config.vm.provision "shell", path: "recipes/mysql.sh"
    config.vm.provision "shell", path: "recipes/postgresql.sh"
    #mongo
    #mysql

    #PHP + NGINX
    config.vm.provision "shell", path: "recipes/php.sh"
    config.vm.provision "shell", path: "recipes/nginx.sh"

    #Templates
    config.vm.provision "shell", path: "recipes/configure.sh"

    config.vm.post_up_message = "Environment ready to be used."
end