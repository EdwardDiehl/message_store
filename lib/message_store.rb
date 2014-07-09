require "message_store/version"
require 'securerandom'

module MessageStore
  module Backends
    autoload :File, 'message_store/backends/file'
  end

  def self.new(options = {})
    BackendsPool.new(options)
  end

  class BackendsPool
    def initialize(options = {})
      @backends_pool = {}
      options.each do |backend, options|
        @backends_pool[backend] = ::MessageStore::Backends.const_get(backend).new(options)
      end
    end

    def post(message = {})
      message_id = message.keys.first || SecureRandom.hex(16)

      threads = []
      @backends_pool.each_value do |store|
        threads  << Thread.new {
          store.post(message_id, message.values.first)
        }
      end
      threads.each(&:join)

      message_id
    end

    def []=(id, message)
      post(id => message)
    end
  end
end
