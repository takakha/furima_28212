require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
    it "必須項目が存在すれば登録できる" do
      expect(@user).to be_valid
    end
    
    it "passwordが6文字以上かつ半角英数字混合であれば登録できること" do
      @user.password = "yyy456"
      @user.password_confirmation = "yyy456"
      expect(@user).to be_valid
    end

  end
end



   context '新規登録がうまくいかないとき' do
    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "@を含まないemailは登録できないこと" do
      @user.email = "yadafafa.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英数字混合でなければ登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end    
end
end
end
