@required_plugins = ['vagrant-vbguest']

hosts = [

  # Replicas of live VMs
  #Webservers
  {hostname: 'logicdesk_webserver1', box: 'ubuntu/bionic64', ip: '10.10.10.2', cpus: 1, memory: 256, port_arr: [], cmd: '' },
  {hostname: 'logicdesk_webserver2', box: 'ubuntu/bionic64', ip: '10.10.10.3', cpus: 1, memory: 256, port_arr: [], cmd: '' },
  
  # Database
  {hostname: 'logicdesk_db', box: 'OrangeLark/mysql', ip: '10.10.30.2', cpus: 1, memory: 512, port_arr: [], cmd: 'apt-get install python-mysqldb -y' },

]

Vagrant.configure("2") do |config|

  config.vbguest.auto_update = true
  config.ssh.insert_key = false

  hosts.each do |host|
    config.vm.define host[:hostname] do |vm_config|
      vm_config.vm.box = "#{host[:box]}"
      vm_config.vm.network :private_network, ip: host[:ip]
      vm_config.vm.provider :virtualbox do |vbox|
        vbox.name = "#{host[:hostname]}"
        vbox.cpus = "#{host[:cpus]}"
        vbox.memory = "#{host[:memory]}"
        vbox.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      host[:port_arr].each do |ports|
        vm_config.vm.network "forwarded_port", guest: ports[:gport], host: ports[:hport]
      end
      vm_config.vm.provision "shell", inline: "#{host[:cmd]}"
      vm_config.vm.provision "ansible" do |ansible|
        ansible.playbook = "site.yml"
        ansible.config_file = "ansible.cfg"
        ansible.inventory_path = "inventory.yml"
        ansible.vault_password_file = ".vault"
        ansible.verbose = ""
        ansible.raw_arguments  = ["--diff"]
        ansible.extra_vars = {
          db_admin_user: "root",
          db_admin_password: "root",
          db_hostname: "10.10.30.2"
        }
      end
    end
  end
end
