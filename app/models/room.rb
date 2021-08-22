class Room < ApplicationRecord
  belongs_to :member
  belongs_to :foster
  has_many :messages, dependent: :destroy
  
  def self.All()
    Room.includes(:member).where(members: {is_deleted: false}) #includesで内部結合 is_deletedがfalseの人が退会していない人
  end
end
