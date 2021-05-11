class Equipment < ApplicationRecord
    has_many :brews
    validates :brand_model, presence: true, uniqueness: true

end
