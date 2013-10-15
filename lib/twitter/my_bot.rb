require './config/twitter.conf.rb'
require 'tweetstream'
require 'json'

TweetStream.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = ACCESS_TOKEN
  config.oauth_token_secret = ACCESS_TOKEN_SECRET
  config.auth_method        = :oauth
end

filename = "./tmp/yukky.json"

client = TweetStream::Client.new
client.userstream do |status|
  if status.in_reply_to_user_id == 1948200805 then
    yukky = Array.new

    if File.exist?(filename) then
      open(filename,"r") do |fp|
        yukky = JSON.parse(fp.read)
      end
    end

    now = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    json_id = yukky.length

    tmp_json = { "time" => now, "desc" => status.text, "user" => status.user.name, "id" => json_id }
    my_json = yukky.unshift tmp_json

    open(filename,"w") do |io|
      JSON.dump(my_json, io)
    end
  end
end
