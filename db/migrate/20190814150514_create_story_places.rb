class CreateStoryPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :story_places do |t|
      t.integer :story_id
      t.integer :place_id
      t.timestamp
    end
  end
end
