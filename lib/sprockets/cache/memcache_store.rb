require 'dalli'

module Sprockets
  class Cache
    # A simple Memcache cache store.
    #
    #     environment.cache = Sprockets::Cache::MemcacheStore.new
    #
    class MemcacheStore
      def initialize(key_prefix = 'sprockets')
        if ENV['MEMCACHED_ENDPOINT']
          options = { username: ENV['MEMCACHED_USERNAME'], password: ENV['MEMCACHED_PASSWORD'], socket_timeout: ENV['MEMCACHED_SOCKET_TIMEOUT'] }
          @memcache = Dalli::Client.new(ENV['MEMCACHED_ENDPOINT'], options)
        else
          @memcache = Dalli::Client.new
        end
        @key_prefix = key_prefix
      end

      # Lookup value in cache
      def [](key)
        data = @memcache.get path_for(key)
        Marshal.load data if data
      rescue ::Dalli::DalliError, Errno::ECONNREFUSED
      end

      # Save value to cache
      def []=(key, value)
        @memcache.set path_for(key), Marshal.dump(value)
        value
      rescue ::Dalli::DalliError, Errno::ECONNREFUSED
      end

      private

      def path_for(key)
        "#{@key_prefix}:#{key}"
      end
    end
  end
end
