class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :reviews
  validates :start_date, presence: true
  validates :end_date, presence: true
end
