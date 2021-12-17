class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.string :name
      t.integer :id
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
