class Brew < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users_commented, through: :comments, source: :user
    
    validates :name, :brand, :grind_size, :dose, :extraction_volume, :extraction_time, presence: true

    def self.alpha
        order(:name)
    end 
end
