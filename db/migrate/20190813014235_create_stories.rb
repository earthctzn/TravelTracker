class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :content
      t.belongs_to :users
      t.timestamp
    end
  end
end
