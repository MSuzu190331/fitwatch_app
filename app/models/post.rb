class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  # has_many :users ,through :like
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
end