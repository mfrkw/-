class Room < ApplicationRecord
  belongs_to :member
  belongs_to :foster
  has_many :messages
end
