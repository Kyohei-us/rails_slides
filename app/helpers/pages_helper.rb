module PagesHelper
    def spotifyURItoEmbed(uri)
        if (!uri)
            return ""
        end
        startSpotify = "https://open.spotify.com/"
        if uri.start_with?(startSpotify)
            return uri.sub(startSpotify, startSpotify+"embed/")  
        else 
            return uri
        end
    end

    def getRecentlyListenedTracks(lastfmUserName)
        lastfmAPIkey = Rails.application.credentials.lastfmAPIkey
        response = HTTParty.get("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{lastfmUserName}&api_key=#{lastfmAPIkey}&format=json&limit=10", format: :plain)
        body = JSON.parse(response.body, symbolize_names: true)
        recentTracks = body[:recenttracks]
        tracksArray = recentTracks[:track]
        return tracksArray
    end

    def getTrackName(lastfmTrack)
        return lastfmTrack[:name]
    end

    def getTrackArtist(lastfmTrack)
        return lastfmTrack[:artist][:"#text"]
    end

    def isNowPlaying(lastfmTrack)
        if lastfmTrack[:@attr] && lastfmTrack[:"@attr"][:nowplaying] == "true"
            return true
        else
            return false
        end
    end

    def getTrackInfo(trackName, artistName)
        lastfmAPIkey = Rails.application.credentials.lastfmAPIkey
        target = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=#{lastfmAPIkey}&artist=#{CGI.escape(artistName)}&track=#{CGI.escape(trackName)}&format=json"
        response = HTTParty.get(target, format: :plain)
        return response
    end
end
