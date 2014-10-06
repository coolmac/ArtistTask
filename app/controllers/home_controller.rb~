class HomeController < ApplicationController
  def index
  end
  def search_history
        @id=current_user.id
       @user= User.find(@id)
        @histories= @user.histories
  end
  def search_artist
    @history= History.new
     @lastfm = Lastfm.new
     @artist_search = @lastfm.get_artist_search( params[:search])
     @artist = @artist_search["results"]["artistmatches"]["artist"][0]
     @albums = @lastfm.get_artist_albums(@artist["name"])
     @tracks = @lastfm.get_artist_top_tracks(@artist["name"])
     @similar_artists = @lastfm.get_similar_artists(@artist["name"])
    @history.search_term = @artist["name"]
    @history.user_id= current_user.id
    @history.save
    
     
     respond_to do |format|
        format.html  
        #format.json  { render :partial => "artistinfo", :locals => {@artistinfo => @artistinfo, :query => params[:search]} }
     end
  end
end
