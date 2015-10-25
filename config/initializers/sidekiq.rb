Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end