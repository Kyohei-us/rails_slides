class CreateMusicTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :music_tracks do |t|
      t.string :name
      t.string :spotifyURI

      t.timestamps
    end
  end
end
