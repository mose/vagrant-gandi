require 'xmlrpc/client'
require 'gandi-api/zlib-parser'

module GandiApi
  class Connection

    XMLRPC::Config.module_eval {
      remove_const(:ENABLE_NIL_PARSER)
      const_set(:ENABLE_NIL_PARSER, true)
    }

    def initialize(opts = {})
      raise(RuntimeError, "You need to specify a Gandi API Key.") unless opts.has_key?(:api_key) && opts[:api_key]
      @api_key = opts[:api_key]
      @apiclient = XMLRPC::Client.new2('https://rpc.gandi.net/xmlrpc/')
      @apiclient.http_header_extra = { "Accept-Encoding" => "gzip" }
      @apiclient.set_parser ZlibParser.new(@apiclient.send(:parser))
    end

    def rawquery(*args)
      begin
        @apiclient.call(*args)
      rescue Exception => e
        { 'error' => e.message }
      end
    end

    def query(command, args = {})
      rawquery(command, @api_key, args)
    end

    def query_simple(command)
      rawquery(command, @api_key)
    end

  end
end
