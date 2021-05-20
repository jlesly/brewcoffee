class User < ApplicationRecord
    has_secure_password
    has_many :brews
    has_many :comments
    has_many :brew_comments, through: :brews, source: :comments

    validates :email, presence: true
    validates :username, presence: true, uniqueness: true 

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
      end

end
