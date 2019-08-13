class Place < ActiveRecord::Base

    belongs_to :users
    has_many :stories :through :users

end
