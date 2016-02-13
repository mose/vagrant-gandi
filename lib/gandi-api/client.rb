require 'xmlrpc/client'
require 'gandiapi/zlib-parser'

module GandiApi
  class Client

    def initialize(opts = {})
      raise RuntimeError, "You need to specify a Gandi API Key." unless opts[:api_key]
      @api_key = opts[:api_key]
      @apiclient = XMLRPC::Client.new2('https://rpc.gandi.net/xmlrpc/')
      @apiclient.http_header_extra = { "Accept-Encoding" => "gzip" }
      @apiclient.set_parser ZlibParser.new(@apiclient.send(:parser))
    end

  end
end
