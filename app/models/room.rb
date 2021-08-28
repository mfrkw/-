class Room < ApplicationRecord
  belongs_to :member
  belongs_to :foster
  has_many :messages, dependent: :destroy

  def self.AllMember()
    Room.includes(:member).where(members: { "is_deleted" => false })
    # includesで内部結合 is_deletedがfalseの人が退会していない人
  end

  def self.AllFoster()
    Room.includes(:foster).where(fosters: { "is_deleted" => false })
    # includesで内部結合 is_deletedがfalseの人が退会していない人
  end
end
