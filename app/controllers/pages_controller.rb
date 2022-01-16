class PagesController < ApplicationController
  def home
    if(current_user && current_user.user_profile)
    @recentTracks = helpers.getRecentlyListenedTracks(current_user.user_profile.lastfmUsername)
    end
  end

  def changeLastfmUserName
  end

  def trackInfo
    trackName = params[:trackName]
    artist = params[:artist]
    response = helpers.getTrackInfo(trackName, artist)
    @response = JSON.parse(response)
    render :json => @response
  end

  def myBookmarks 
  end
end
