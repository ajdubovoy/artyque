class Artwork < ApplicationRecord
  belongs_to :collection
  has_many :photos, -> { order(position: :asc) }, dependent: :destroy
  has_many :videos, -> { order(position: :asc) }, dependent: :destroy
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  scope :highlights, -> { where(highlight: true) }
  scope :non_highlights, -> { where(highlight: false) }
end
