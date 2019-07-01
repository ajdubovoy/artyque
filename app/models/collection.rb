class Collection < ApplicationRecord
  belongs_to :artist
  has_many :artworks, dependent: :destroy
  has_many :artworks, -> { where(highlight: true) }
  validates :name, uniqueness: true, presence: true
end
