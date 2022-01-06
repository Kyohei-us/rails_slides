module PagesHelper
    def spotifyURItoEmbed(uri)
        startSpotify = "https://open.spotify.com/"
        if uri.start_with?(startSpotify)
            uri.sub(startSpotify, startSpotify+"embed/")  
        else 
            uri
        end
    end
end
