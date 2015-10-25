REDIS_URL = ENV["REDISCLOUD_URL"] #|| 'redis://rediscloud:vqJieZPUYxReLWTw@pub-redis-13288.us-east-1-2.4.ec2.garantiadata.com:13288'

if Rails.env.development?
  $redis = Redis.new(host: 'localhost', port: 6379)
else
  $redis = Redis.new(:url => REDIS_URL)
end
