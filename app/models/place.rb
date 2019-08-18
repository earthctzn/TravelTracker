class Place < ActiveRecord::Base
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true

    has_many :story_places
    has_many :stories, through: :story_places

end
