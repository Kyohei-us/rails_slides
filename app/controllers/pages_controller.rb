class PagesController < ApplicationController
  def home
    if(current_user && current_user.user_profile)
    @recentTracks = helpers.getRecentlyListenedTracks(current_user.user_profile.lastfmUsername)
    end
  end

  def changeLastfmUserName
  end

  def myBookmarks 
  end
end
