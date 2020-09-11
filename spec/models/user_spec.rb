require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、passwordとpassword_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できる" do
        @user.email = "kkkk@gmail.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で登録できる" do
        @user.password = "000000ss"
        @user.password_confirmation = "000000ss"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合で登録できる" do
        @user.password = "Ssaa11"
        @user.password_confirmation = "Ssaa11"
        expect(@user).to be_valid
      end
      it "last_nameとfirst_nameが全角であれば登録できる" do
        @user.last_name = "山田"
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "last_name_kanaとfirst_name_kanaが全角カナであれば登録できる" do
        @user.last_name_kana = "ヤマダ"
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかない時" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
       @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "メールアドレスが一意でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに＠が含まれていないと登録が出来ない" do
        @user.email = "kkkk.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "苗字、名前が全角（漢字・ひらがな・カタカナ）以外は登録が出来ない" do
        @user.last_name = "ﾃﾗﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名前が全角（漢字・ひらがな・カタカナ）以外は登録が出来ない" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "苗字のフリガナは全角カタカナ以外は登録できない" do
        @user.last_name_kana = "山田たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名前のフリガナは全角カタカナ以外は登録できない" do
        @user.first_name_kana = "山田たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "000ss"
        @user.password_confirmation = "000ss"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)",
        "Password is too short (minimum is 6 characters)",
        "Password confirmation is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混在でなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英字と数字両方を含むパスワードを設定してください", "Password confirmation は英字と数字両方を含むパスワードを設定してください")
      end
    end
  end
end