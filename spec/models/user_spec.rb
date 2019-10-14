require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmatio, Prefectures, address（名前、ニックネーム、メールアドレス、都道府県、住所、パスワードが正しく入力されていれば登録できる）" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name(名前の入力がないと無効)" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    it "is invalid without a nickname(ニックネームの入力がないと無効)" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "is invalid without a email(メールアドレスの入力がないと無効)" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "is invalid when same email exists(メールアドレスが重複してると無効)" do
      user1 = create(:user, email: "example@example.com")
      user2 = build(:user, name: "sato", email: "example@example.com")
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに登録されています。")
    end

    it "is invalid without a Prefectures(都道府県の入力がないと無効)" do
      user = build(:user, Prefectures: "")
      user.valid?
      expect(user.errors[:Prefectures]).to include("が入力されていません。")
    end

    it "is invalid without a address(住所の入力がないと無効)" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("が入力されていません。")
    end

    it "is invalid without a password(パスワードの入力がないと無効)" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "is invalid a wrong password_confirmation(確認用パスワードとパスワードが同じでないと無効)" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("がパスワードと一致しません。")
    end

    it "is invalid short password(パスワードが短いと無効)" do
      user = build(:user, password: "777")
      user.valid?
      expect(user.errors[:password]).to include("は６文字以上で入力してください。")
    end

  end
end


