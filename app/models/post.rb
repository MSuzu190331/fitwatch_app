class Post < ApplicationRecord
# class Post < ActiveRecord::Base
  validates :name_id, :about, :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :design
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  has_many :comments
end
