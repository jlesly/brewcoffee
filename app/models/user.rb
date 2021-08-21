class User < ApplicationRecord
    has_secure_password
    has_many :brews
    has_many :comments
    has_many :brew_comments, through: :brews, source: :comments

    validates :email, presence: true
    validates :username, presence: true, uniqueness: true 

    def self.from_omniauth(auth)
      #Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        if auth.info.uid
          user.uid = auth.info.uid
        end
        user.password = SecureRandom.hex
      end
    end
end
