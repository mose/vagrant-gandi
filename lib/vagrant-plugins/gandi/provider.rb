require 'gandi-api'
require 'vagrant-plugins/gandi'

module VagrantPlugins
  module Gandi
    class Provider < Vagrant.plugin(2, :provider)

      def initialize(machine)
        @machine = machine
      end

      def action(name)
        action_method = "action_#{name}".to_sym
        Action.send(action_method) if Action.respond_to?(action_method)
      end

    end
  end
end
