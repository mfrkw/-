class Foster < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :dogs, dependent: :destroy
  
  validates :last_name, :first_name, :postal_code, :email, :telephone_number, :address, presence: true
end
