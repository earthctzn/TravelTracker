class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates_confirmation_of :password
    
    


    has_many :stories
    has_many :places, through: :stories

end


