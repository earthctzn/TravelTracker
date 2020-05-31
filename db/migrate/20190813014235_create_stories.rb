class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.datetime :story_date
      t.timestamps
    end
  end
end
