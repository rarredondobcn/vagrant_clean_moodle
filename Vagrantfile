Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.hostname = "moodle.test"
  config.vm.network :private_network, ip: "192.168.0.10"
  config.vm.synced_folder "./html", "/var/www/html",
    owner: "www-data", group: "www-data",
    create: true
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
  end
  config.vm.provision "shell", path: "script.sh"
end
