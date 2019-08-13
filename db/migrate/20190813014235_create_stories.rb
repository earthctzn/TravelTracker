class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.sting :content
      t.belongs_to :users
      t.has_many :places
      t.timestamp
    end
  end
end
