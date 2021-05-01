class Comment < ApplicationRecord
  belongs_to :brew
  belongs_to :user

  validates :content, presence: true
end
