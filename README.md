# Sprockets::Memcache::Store

```ruby
environment.cache = Sprockets::Cache::MemcacheStore.new
```

## Installation

Add this line to your application's Gemfile:

    gem 'sprockets-memcache-store'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sprockets-memcache-store

## Configuration

If necessary, set the following environment variables for production:

    MEMCACHED_ENDPOINT
    MEMCACHED_USERNAME
    MEMCACHED_PASSWORD
    MEMCACHED_SOCKET_TIMEOUT

The `MEMCACHED_SOCKET_TIMEOUT` should be long enough (8000 or 8 seconds) to avoid Timeout issues.


```ruby
options = { username: ENV['MEMCACHED_USERNAME'], password: ENV['MEMCACHED_PASSWORD'], socket_timeout: ENV['MEMCACHED_SOCKET_TIMEOUT'] }
environment.cache = Sprockets::Cache::MemcacheStore.new('sprockets', ENV['MEMCACHED_ENDPOINT'], options)
```

This is useful if you use services like Memcachier off platforms like Heroku.
