class Story < ActiveRecord::Base

    belongs_to :users
    has_many :places :through :users
end