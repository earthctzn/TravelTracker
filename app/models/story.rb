class Story < ActiveRecord::Base
    validates :user_id, presence: true
    validates :title, presence: true
    validates :content, presence: true
    validates :story_date, presence: true



    belongs_to :user
    has_many :story_places
    has_many :places, through: :story_places

    
    
end