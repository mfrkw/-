class Like < ApplicationRecord
  belongs_to :member
  belongs_to :dog
  
  validates_uniqueness_of :dog_id, scope: :member_id
end
