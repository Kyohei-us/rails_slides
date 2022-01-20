module MusicTracksHelper
    def handleSpotifyPreview(music_track)
        preview = ""
        if music_track.spotifyURI == ""
            preview = "<p>Preview Not Available for #{music_track.name}</p>"
        else
            preview = "<iframe class='spotify_compact preview_player' src=#{spotifyURItoEmbed(music_track.spotifyURI)} width='300' frameborder='0' allowtransparency='true' allow='encrypted-media'></iframe>"
        end
        return preview.html_safe
    end
end
