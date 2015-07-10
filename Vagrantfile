# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "gajdaw/sinatra"
  config.vm.network :forwarded_port, guest: 9393, host: 9393
    config.vm.provision :docker do |d|
    d.pull_images "ubuntu"
  end
end