class User < ApplicationRecord
    has_secure_password
    has_many :brews
    has_many :comments
    has_many :brew_comments, through: :brews, source: :comments

    validates :email, presence: true
    validates :username, presence: true, uniqueness: true 
end
