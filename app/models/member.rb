class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, :first_name, :postal_code, :email, :telephone_number, :address, presence: true
  
  has_many :likes, dependent: :destroy
  has_many :dogs
  
  
  def already_liked?(dog)
    self.likes.exists?(dog_id: dog.id)
  end
#selfにはcurrent_memberが入る
# trueだったらいいねを外すfalseだったらいいねをつける
 
 
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
end
