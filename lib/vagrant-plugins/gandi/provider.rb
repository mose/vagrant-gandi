require 'gandi-api'
require 'vagrant-plugins/gandi'

module VagrantPlugins
  module Gandi
    class Provider < Vagrant.plugin(2, :provider)

      def initialize(machine)
        @machine = machine
      end

      def server(machine, opts = {})
        gandi_api = 
      end

    end
  end
end
