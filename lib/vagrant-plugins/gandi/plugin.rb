begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant Gandi plugin must be run within Vagrant."
end

if Vagrant::VERSION < "1.2.0"
  raise "The Vagrant Gandi plugin is only compatible with Vagrant 1.2+"
end

module VagrantPlugins
  module Gandi
    class Plugin < Vagrant.plugin("2")
      name "Gandi"
      description "This plugin installs a provider for managing Gandi.net VPS instances."

      config(:gandi, :provider) do
        require_relative 'config'
        Config
      end

      
    end
  end
end
