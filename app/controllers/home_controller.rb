class HomeController < ApplicationController
  def index
  end
  def search_artist
    
    @lastfm = Lastfm.new
    @artist_search = @lastfm.get_artist_search( params[:search])
    @albums = @lastfm.get_artist_albums(params[:search])
    
    respond_to do |format|
      
        format.html  
       # format.json  { render :partial => "artistinfo", :locals => {@albums => @albums, :query => params[:search]} }
       # format.js
       #format.json { render json: @albums, status: :created, location: @user }
    
   end
  end
end
