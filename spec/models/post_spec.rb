require 'rails_helper'
describe Post do
  describe '#create' do

    it "is valid with a about, image, design(詳細、画像、デザインの入力があると登録ができる)" do
      user = create(:user)
      post = build(:post)
      expect(post).to be_valid
    end

    it "is invalid without a about(時計詳細の入力がないと無効)" do
      user = create(:user)
      post = build(:post, about: "")
      post.valid?
      expect(post.errors[:about]).to include("を入力してください")
    end

    it "is invalid without a image(画像の入力がないと無効)" do
      user = create(:user)
      post = build(:post, image: "")
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end

    it "is invalid without a design(時計デザインの入力がないと無効)" do
      user = create(:user)
      post = build(:post, name_id: "")
      post.valid?
      expect(post.errors[:name_id]).to include("を入力してください")
    end

  end
end


