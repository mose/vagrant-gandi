vagrant-gandi
======================

Vagrant-gandi is a provider plugin for Vagrant, to enable management of Gandi IaaS virtual servers.

- create and destroy servers

Installation
--------------------

Provided that you already have your Vagrant installed and setup, you can get this plugin with:

    vagrant plugin install vagrant-gandi

Configuration
---------------------

Here is an example of Vagrantfile using the vagrant-gandi plugfin that you just installed:

```
Vagrant.configure('2') do |config|
  config.vm.hostname = 'dropletname.example.com'
  # Alternatively, use provider.name below to set the Droplet name. config.vm.hostname takes precedence.

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.token = 'YOUR TOKEN'
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'nyc2'
    provider.size = '512mb'
  end
end
```

Usage
---------------

When your Vagrantfile is configured, you can create your new server with

    vagrant up --provider=gandi

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/vagrant-gandi.

Contributing
----------------
Bug reports and pull requests are welcome on GitHub at https://github.com/Gandi/vagrant-gandi

Authors
-----------
Vagrant-gandi is written by [@mose](https://github.com/mose).

License
-----------
Vagrant-gandi Vagrant plugin is available under [MIT License](http://opensource.org/licenses/MIT).

Copyright
------------
copyright (c) 2016 Gandi http://gandi.net
