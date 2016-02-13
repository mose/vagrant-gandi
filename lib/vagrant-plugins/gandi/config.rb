module VagrantPlugins
  module Gandi
    class Config < Vagrant.plugin("2", :config)

      attr_accessor :api_key
      attr_accessor :from_id
      attr_accessor :datacenter
      attr_accessor :image
      attr_accessor :hostname
      attr_accessor :cores
      attr_accessor :memory
      attr_accessor :max_memory
      attr_accessor :ip_version
      attr_accessor :bandwidth
      attr_accessor :key_ids
      attr_accessor :password
      attr_accessor :ssh_key

      attr_accessor :instance_check_interval
      attr_accessor :instance_ready_timeout

      def initialize
        @api_key                  = UNSET_VALUE
        @from_id                  = UNSET_VALUE
        @datacenter               = UNSET_VALUE
        @image                    = UNSET_VALUE
        @hostname                 = UNSET_VALUE
        @cores                    = UNSET_VALUE
        @memory                   = UNSET_VALUE
        @max_memory               = UNSET_VALUE
        @ip_version               = UNSET_VALUE
        @bandwidth                = UNSET_VALUE
        @key_ids                  = []
        @ssh_key                  = UNSET_VALUE
        @instance_check_interval  = UNSET_VALUE
        @instance_ready_timeout   = UNSET_VALUE
      end

      def finalize!
        @api_key = ENV['GANDI_API_KEY'] if @api_key == UNSET_VALUE
        @instance_ready_timeout = 120 if @instance_ready_timeout == UNSET_VALUE
        @instance_check_interval = 5 if @instance_check_interval == UNSET_VALUE
        @datacenter = ''
      end

    end
  end
end
