
module GandiApi
  class ZlibParser
    def initialize(parser)
      @parser = parser
    end
    def parseMethodResponse(responseText)
      @parser.parseMethodResponse(Zlib::GzipReader.new(StringIO.new(responseText)).read)
    end
    def parseMethodCall(*args)
      @parser.parseMethodCall(*args)
    end
  end
end
