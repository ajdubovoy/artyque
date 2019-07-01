class Collection < ApplicationRecord
  belongs_to :artist
  has_many :artworks, dependent: :destroy
  has_many :photos, through: :artworks
  validates :name, presence: true
end
