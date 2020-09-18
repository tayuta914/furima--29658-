require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "first_nameとfirst_name_kanaとlast_nameとlast_name_kanaとnicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "passwordは6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end

      it "ユーザーの名字があれば登録できる" do
        @user.first_name = "田中"
        expect(@user).to be_valid
      end

      it "ユーザーの名前があれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it "ユーザーの名字のフリガナがあれば登録できる" do
        @user.first_name = "タナカ"
        expect(@user).to be_valid
      end

      it "ユーザーの名前のフリガナがあれば登録できる" do
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end

      it "生年月日があれば登録できる" do
        @user.birthday = "20200918"
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに＠が含まれていなと登録できない" do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは半角英数字混合がないと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
    end
  end
end
