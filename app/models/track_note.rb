class TrackNote < ApplicationRecord
    belongs_to :user
    belongs_to :music_track
end
