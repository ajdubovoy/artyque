class Artwork < ApplicationRecord
  belongs_to :collection
  has_many :photos, -> { order(position: :asc) }, dependent: :destroy
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  scope :highlights, -> { where(highlight: true) }
end
