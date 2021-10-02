# bearer token AAAAAAAAAAAAAAAAAAAAAGPeUAEAAAAAG2Pku5fMjJXi7y8SHl%2FmpHY%2FncQ%3D98qgahHuJ3PqpHBQLiRprkLswyT6KkbwbyamgQvJH1f0Ve8AhW

# twitterライブラリの呼び出し
require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "SmBXvlCiYqMAy1pK3YqSXZ4Xr"
  config.consumer_secret     = "gr89HTrT6E1uRzKMjEuhgFlTKy6RyUSUoFYlf8KIRy5aTjq82j"
  config.access_token        = "1038705496474058752-pARBydqBUZhUz1CoufCHVYVvghPjqd"
  config.access_token_secret = "4EDmGOs7TqknlqHVAnxfzoJsP5dGCSXVPctcGpNGmQtqX"
end

# client tutorial
def tutorial
  puts "Welcome to Hoge Client."
  puts "このclientを起動時する際、末尾にオプションをつけてください"
  puts "-t HomeのTimeline取得"
  puts "-m リプライの取得"
  puts "-l リストの取得"
  puts "ツイートしたい内容 ツイートする！"
end

# display timeline
def homeTimeline
  @client.home_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

# display mentions
def mentionTimeline
  @client.mentions_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end
end

# tweet
def tweet
  @client.update(ARGV[0])
  puts "Tweetしたぞい"
end

option = ARGV[0].to_s

if option == "" then
  tutorial
elsif option == "-t" then
  homeTimeline
elsif option == "-m" then
  mentionTimeline
else
  tweet
  homeTimeline
end