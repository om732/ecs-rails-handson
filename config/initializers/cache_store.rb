Rails.application.config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'] }
Rails.application.config.session_store :cache_store, key: '__handson'
