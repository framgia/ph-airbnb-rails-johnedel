class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates :home_type, presence: true, length: { maximum: 50 }
  validates :room_type, presence: true, length: { maximum: 50 }
  validates :accommodate, presence: true, length: { maximum: 50 }
  validates :bedrooms, presence: true, length: { maximum: 50 }
  validates :bathrooms, presence: true, length: { maximum: 50 }
end