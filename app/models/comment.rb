class Comment < ApplicationRecord
  belongs_to :brew
  belongs_to :user
end
