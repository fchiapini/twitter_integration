require 'twitter'
require 'net/http'
require 'uri'
require 'json'

if !ARGV.empty?
  # Connecting to the Twitter Streaming API
  tweets = Twitter::Streaming::Client.new do | config |
    config.consumer_key        = "1dB8iOZUUBaFgqozjE2iqfSIg"
    config.consumer_secret     = "jNOQQxmEsJrtxdtnRrMN7JDpDtohKDfSxzQmf9UYOIlemkYQwq"
    config.access_token        = "387129857-fomgij6Mj2CTTbfBcra9AZI4DUccdu3uVhDOEhyT"
    config.access_token_secret = "mSHLJ4elqyoajqTTsaUNW2xdetfYBkAXaxgWHhDt6LAIL"
  end

  # One or multiple keywords
  if ARGV.length == 1
    topic = ARGV[ 0 ]
  else
    topics = ARGV
  end

  puts ARGV.length

  # Filtering in the Twitter API by the keywords previously sent in the command line
  tweets.filter( track: ARGV.length == 1 ? topic : topics.join( "," ) ) do | object |

  # Building the tweet's parameters from the streaming Twitter API
  params = { user_name: "@#{object.user.screen_name}", text: object.text, posted_at: object.created_at, twitter_id: object.id } if object.is_a?( Twitter::Tweet )
		
  # Calling the post request to the API for storing tweets on the database
  url = 'http://api.rails_twitter_api.dev/tweets'
  uri = URI.parse( url )

  http = Net::HTTP.new( uri.host, uri.port )

  request = Net::HTTP::Post.new(
                                 uri.request_uri, 
                                 initheader = {'Content-Type' =>'application/json'}
                               )
  request.body = params.to_json

  response = http.request( request )
  puts( response.body )

  end
else
	puts "Fill with some topics to search for tweets!"
end
