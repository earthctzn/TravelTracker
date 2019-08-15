class StoryPlace < ActiveRecord::Base

    belongs_to :story 
    belongs_to :place 

end