class Comment < ApplicationRecord
  validates :user_id, :post_id, :message, presence: true
  belongs_to :user
  belongs_to :post
end
