class Like < ApplicationRecord
  belongs_to :member
  belongs_to :dog
  has_one :foster, through: :dog # dogテーブルを通してfosterを持ってくる

  validates_uniqueness_of :dog_id, scope: :member_id

  def self.All()
    Like.includes(:dog, :foster).where(fosters: { is_deleted: false })
    # includesで内部結合 is_deletedがfalseの人が退会していない人
  end
end
