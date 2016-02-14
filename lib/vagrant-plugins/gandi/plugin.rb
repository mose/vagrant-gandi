begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant Gandi plugin must be run within Vagrant."
end

require "log4r"

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

      provider(:gandi, parallel: true) do
        setup_logging
        setup_i18n
        require_relative "provider"
        Provider
      end

      def self.setup_i18n
        I18n.load_path << File.expand_path("locales/en.yml", Gandi.source_root)
        I18n.reload!
      end

      def self.setup_logging
        level = nil
        begin
          level = Log4r.const_get(ENV["VAGRANT_LOG"].upcase)
        rescue NameError
          level = nil
        end
        level = nil if !level.is_a?(Integer)
        if level
          logger = Log4r::Logger.new("vagrant_gandi")
          logger.outputters = Log4r::Outputter.stderr
          logger.level = level
          logger = nil
        end
      end

    end
  end
end
