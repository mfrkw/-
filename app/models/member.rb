class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, :first_name, :postal_code, :email, :telephone_number, :address, presence: true
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end
