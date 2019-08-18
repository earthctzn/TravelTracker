class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password_confirmation, presence: true, on: :create
    


    has_many :stories
    has_many :places, through: :stories

end


