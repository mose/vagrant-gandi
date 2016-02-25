require "log4r"

module VagrantPlugins
  module Gandi
    module Action

      class ConnectGandi
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_gandi::action::connect_gandi")
        end

        def call(env)
          datacenter = env[:machine].provider_config.datacenter

          # Build the fog config
          fog_config = {
            :provider => :gandi,
            :datacenter   => datacenter
          }

          fog_config[:gandi_key_id] = region_config.access_key_id
          @logger.info('Connecting to Gandi...')

          @app.call(env)
        end        
      end

    end
  end
end
