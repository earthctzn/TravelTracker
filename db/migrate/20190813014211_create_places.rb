class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :user_id
      t.integer :story_id
      t.datetime :visit_date
      t.timestamp
    end
  end
end
