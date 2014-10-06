require 'httparty'
class Lastfm
include HTTParty
  base_uri 'http://ws.audioscrobbler.com/2.0/'
  default_params :api_key => '7a158277d79505776149a311b51ebd2f', :format => "json"  #:api_key => Constants::LASTFM_API_KEY

   def get_artist_albums(searchartist)
 
     options = {:artist => searchartist, :method => "artist.getTopAlbums" }
     puts options.to_query  # log purpose
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
    end


    def get_artist_search(searchartist)
 
     options = { :artist => searchartist,:method => "artist.search"}
     puts options.to_query
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
 end
end
