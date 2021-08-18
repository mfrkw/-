class Foster < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :dogs, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  validates :last_name, :first_name, :postal_code, :email, :telephone_number, :address, presence: true
  
  # super=確認用のパスが同じかどうか、ログインさせて良い時の条件を書く。
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  # self=ログインしようとしている会員
  # active_for_authentication?がtrueを返せばログインできる。falseを返せばログインできない。
end
