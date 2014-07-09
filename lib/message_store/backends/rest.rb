require 'net/http'

module MessageStore
  module Backends
    class Rest
      def initialize(options = {})
        @url = options[:url]
      end

      def post(id, message)
        uri = URI("#{@url}/#{id}")
        req = Net::HTTP::Put.new(uri)
        req.body = message
        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
      end
    end
  end
end

