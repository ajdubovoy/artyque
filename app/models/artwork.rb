class Artwork < ApplicationRecord
  belongs_to :collection
  belongs_to :category, optional: true
  has_many :photos, -> { order(position: :asc) }, dependent: :destroy, inverse_of: :artwork
  has_many :videos, -> { order(position: :asc) }, dependent: :destroy, inverse_of: :artwork
  acts_as_list scope: :collection
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  scope :highlights, -> { where(highlight: true) }
  scope :non_highlights, -> { where(highlight: false) }
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true

  def featured_photo
    return nil if photos.empty?
    return photos.first.attachment
  end
end
