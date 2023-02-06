class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_many :stores
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_stores, through: :bookmarks, source: :store
  has_many :reviews, dependent: :destroy

  def liked?(store)
    likes.exists?(store_id: store.id)
  end

  def bookmarked?(store)
    bookmarks.exists?(store_id: store.id)
  end
end
