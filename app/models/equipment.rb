class Equipment < ApplicationRecord
    has_many :brews
    validates :brand, presence: true, uniqueness: true

end
