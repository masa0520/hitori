class Store < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode
end
