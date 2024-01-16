# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
#  config.hostmanager.enabled = true
#  config.hostmanager.manage_guest = true
#  config.hostmanager.manage_host = true
#  config.vm.provision "shell", path: "bootstrap.sh"


  MasterCount = 1

  # Kubernetes Master Nodes
  (1..MasterCount).each do |i|
    config.vm.define "k8smaster" do |masternode|
      masternode.vm.box = "bento/ubuntu-20.04"
      masternode.vm.hostname = "k8smaster.example.com"
      masternode.vm.network "private_network", ip: "192.168.56.100"
      masternode.vm.network "public_network"
      masternode.vm.provider "virtualbox" do |v|
        v.name = "k8smaster"
        v.memory = 2192
        v.cpus = 2
      end
    end
  end

  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "k8sworker#{i}" do |workernode|
      workernode.vm.box = "bento/ubuntu-20.04"
      workernode.vm.hostname = "k8sworker#{i}.example.com"
      workernode.vm.network "private_network", ip: "192.168.56.10#{i}"
      workernode.vm.network "public_network"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "k8sworker#{i}"
        v.memory = 2096
        v.cpus = 2
      end

  end

  config.vm.define "jenkinsmaster" do |jenkins|
    jenkins.vm.box = "generic/rhel9"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.56.30"
    jenkins.vm.provider "virtualbox" do |vb|
     vb.memory = "3048"
   end
  end


  config.vm.define "jenkinsslave" do |jenkins|
    jenkins.vm.box = "bento/ubuntu-20.04"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.56.31"
    jenkins.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
   end
  end

  config.vm.define "docker" do |docker|
    docker.vm.box = "bento/ubuntu-20.04"
    docker.vm.hostname = "jenkins"
    docker.vm.network "private_network", ip: "192.168.56.32"
    docker.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
   end
  end


  config.vm.define "tomcat" do |tomcat|
    tomcat.vm.box = "centos/7"
    tomcat.vm.hostname = "jenkins"
    tomcat.vm.network "private_network", ip: "192.168.56.33"
    tomcat.vm.provider "virtualbox" do |vb|
     vb.memory = "512"
   end
  end

  config.vm.define "ansible" do |ansible|
#    ansible.vm.box = "eurolinux-vagrant/centos-stream-9"
#    ansible.vm.box = "centos/7"
    ansible.vm.box = "generic/rhel9"
    ansible.vm.hostname = "ansible"
    ansible.vm.network "private_network", ip: "192.168.56.20"
    ansible.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
   end
  end


  Count = 5

  # Ansible Worker Nodes
  (1..Count).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "generic/rhel9"
      node.vm.hostname = "node#{i}.example.com"
      node.vm.network "private_network", ip: "192.168.56.20#{i}"
      node.vm.network "public_network"
      node.vm.provider "virtualbox" do |v|
        v.name = "node#{i}"
        v.memory = 512 
        v.cpus = 1
      end

  end



 end

end
end
