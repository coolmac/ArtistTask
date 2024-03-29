require 'httparty'
class Lastfm
include HTTParty
  base_uri 'http://ws.audioscrobbler.com/2.0/'
  default_params :api_key => '7a158277d79505776149a311b51ebd2f', :format => "json"  #:api_key => Constants::LASTFM_API_KEY

   def get_artist_name_correction(searchartist)
     options = { :artist => artist_name,:method => "artist.getCorrection"}
     puts options.to_query
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)  
   end


   def get_artist_albums(artist_name)
     options = {:artist => artist_name, :method => "artist.getTopAlbums", :autocorrect => 1}
     puts options.to_query  # log purpose
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
    end

   def get_artist_top_tracks(artist_name)
     options = {:artist => artist_name, :method => "artist.getTopTracks", :autocorrect => 1}
     puts options.to_query  # log purpose
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
    end

   def get_artist_search(artist_name)
     options = { :artist => artist_name,:method => "artist.search"}
     puts options.to_query
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
   end
   def get_similar_artists(artist_name)
     options = { :artist => artist_name,:method => "artist.getSimilar", :limit=> 5}
     puts options.to_query
     response=self.class.get "/?#{options.to_query}", {} 
     result= JSON.parse(response.body)
   end
end
