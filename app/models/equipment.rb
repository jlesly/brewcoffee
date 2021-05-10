class Equipment < ApplicationRecord
    has_many :brews
    validates :brand, :model, presence: true, uniqueness: true

end
