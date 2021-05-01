class Brew < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_mamy :users_commented, through: :comments, source: :user
    
end
