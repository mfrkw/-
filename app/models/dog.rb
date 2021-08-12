class Dog < ApplicationRecord
  attachment :image   #image_idを持たせたモデルにattachmentmethod書く
  
  belongs_to :foster
  
  validates :name, :introduction, :area, :dog_breed, :image, presence: true
end
