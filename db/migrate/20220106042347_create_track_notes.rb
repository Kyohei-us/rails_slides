class CreateTrackNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :track_notes do |t|
      t.integer :music_track_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
