class Place < ActiveRecord::Base


    has_many :story_places
    has_many :stories, through: :story_places

end
