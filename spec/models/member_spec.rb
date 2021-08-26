require 'rails_helper'

describe Member do
  describe '#create' do
    it "全ての項目の入力が存在すれば登録できること" do
      member = build(:member)
      expect(member).to be_valid
    end
    
    it "last_nameがない場合は登録できないこと" do # テストしたいことの内容
    member = build(:member, last_name: nil) # 変数userにbuildメソッドを使用して、factory_botのダミーデータを代入(今回の場合は意図的にnicknameの値をからに設定)
        member.valid? #バリデーションメソッドを使用して「バリデーションにより保存ができない状態であるか」をテスト
        expect(member.errors[:last_name]).to include("can't be blank") 
    end
    
    it "emailがない場合は登録できないこと" do
        member = build(:member, email: nil)
        member.valid?
        expect(member.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        member = build(:member, password: nil)
        member.valid?
        expect(member.errors[:password]).to include("can't be blank")
      end

      it "encrypted_passwordがない場合は登録できないこと" do
        member = build(:member, encrypted_password: nil)
        member.valid?
        expect(member.errors[:encrypted_password]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        user = build(:member, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "postal_codeがない場合は登録できないこと" do
        member = build(:member, postal_code: nil)
        member.valid?
        expect(member.errors[:postal_code]).to include("can't be blank")
      end

      it "addressがない場合は登録できないこと" do
        member = build(:member, address: nil)
        member.valid?
        expect(member.errors[:address]).to include("can't be blank")
      end

      it "telephone_numberがない場合は登録できないこと" do
        member = build(:member, telephone_number: nil)
        member.valid?
        expect(member.errors[:telephone_number]).to include("can't be blank")
      end
      
      # パスワードの文字数テスト ▼

      it "passwordが6文字以上であれば登録できること" do
        member = build(:member, password: "123456", encrypted_password: "123456")
        expect(member).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        member = build(:member, password: "12345", encrypted_password: "12345")
        member.valid?
        expect(member.errors[:encrypted_password]).to include("is too short (minimum is 6 characters)")
      end

      # email 一意性制約のテスト ▼

      it "重複したemailが存在する場合登録できないこと" do
        member = create(:member)
        another_member = build(:member, email: member.email)
        another_member.valid?
        expect(another_member.errors[:email]).to include("has already been taken")
      end

      # 確認用パスワードが必要であるテスト ▼

      it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
        member = build(:member, encrypted_password: "")
        member.valid?
        expect(member.errors[:encrypted_password]).to include("confirmation doesn't match Password")
      end
  end
end