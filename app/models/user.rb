class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  validates :name, :nickname, :Prefectures, :address, presence: true

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
  # omniauthのコールバック時に呼ばれるメソッド。公式。すでにあったらその情報、なければ下記の通り新規登録される。
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name 
  #   end
  # end

  #自分のサイトのフォームから登録するために既存のユーザーかどうかだけ確認。
  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.omniauth_data"] && session["devise.omniauth_data"]["info"]
        user.email = data["email"] if user.email.blank? 
        user.name = data["name"] if user.name.blank?
      end
      if data = session["devise.omniauth_data"]
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
      end
    end
  end


end
