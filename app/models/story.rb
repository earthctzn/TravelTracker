class Story < ActiveRecord::Base

    belongs_to :user
    has_many :users
    has_many :places, through: :users
    
end