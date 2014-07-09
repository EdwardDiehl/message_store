require 'yaml/store'

module MessageStore
  module Backends
    class File
      def initialize(options = {})
        @store = YAML::Store.new options[:path]
      end

      def post(id, message)
        @store.transaction do
          @store[id] = message
        end
      end
    end
  end
end

