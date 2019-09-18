class Post < ApplicationRecord
# class Post < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :design
  mount_uploader :image, ImageUploader
  # has_many :users ,through :like
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  validates :name_id, :about, :image, presence: true
end
