class Collection < ApplicationRecord
  belongs_to :artist
  has_many :artworks, -> { order(position: :asc) }, dependent: :destroy
  has_many :photos, through: :artworks
  acts_as_list scope: :artist
  validates :name, presence: true
  accepts_nested_attributes_for :artworks, reject_if: :all_blank, allow_destroy: false
end
