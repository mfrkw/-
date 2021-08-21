class Dog < ApplicationRecord
  attachment :image   #image_idを持たせたモデルにattachmentmethod書く
  
  belongs_to :foster
  has_many :likes, dependent: :destroy
  
  validates :name, :introduction, :area, :dog_breed, :image, presence: true
  
  def self.All()
    Dog.includes(:foster).where(fosters: {is_deleted: false}) #includesで内部結合 is_deletedがfalseの人が退会していない人
  end
  
  def self.search(search)
    if search
      Dog.where(['dog_breed LIkE ?',"%#{search}%"])
      # Dogには検索したいテーブル　dog_breedに検索したいカラム名
    else
      Dog.all
      # 検索結果がない場合すべて表示
    end

  end
end
