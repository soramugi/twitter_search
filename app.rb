require 'sinatra'
require 'twitter'
require 'dotenv'
Dotenv.load

WORD = ENV['SEARCH_WORD']

configure do
  enable :sessions
end

# GET /
# GET /?page=2
get '/' do
  @page   = 1 if (@page = params[:page].to_i) == 0
  @word   = WORD
  @tweets = tweets @page
  erb :index
end

def tweets page=1
  client = Twitter::REST::Client.new do |config|
    config.consumer_key    = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
  end
  # infinitescrollが6桁までの数字のインクリメントに対応してないっぽいので
  # sessionに次回検索tweet_idを格納
  id = session[:last] unless page == 1
  options = {lang: 'ja'}
  options[:max_id] = id.to_i - 1 if id
  _tweets = client.search("#{WORD} -rt", options).take(10)
  session[:last] = _tweets.last.id
  _tweets
end
