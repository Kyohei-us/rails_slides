class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.string :lastfmUsername
      t.integer :user_id

      t.timestamps
    end
  end
end
