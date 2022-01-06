require 'rails_helper'

# RSpec.describe MusicTrack, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe MusicTrack, type: :model do 
  context 'when music_track is created' do  # (almost) plain English
    it 'creates a music_track' do
      newChar = MusicTrack.create(name: "Loveletter", spotifyURI: "https://open.spotify.com/track/3w8T6SnpS49Tmoc9L1IrIF?si=c29999edf50f4247")
      expect(newChar).to be_an_instance_of MusicTrack  # test code
    end
  end
end