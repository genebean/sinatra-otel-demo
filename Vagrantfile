# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "genebean/centos-7-docker-ce"
  config.vm.network "forwarded_port", guest: 9292, host: 9292
end

