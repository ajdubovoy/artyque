class Artwork < ApplicationRecord
  belongs_to :collection
  has_many :photos, -> { order(position: :asc) }, dependent: :destroy
  has_many :videos, -> { order(position: :asc) }, dependent: :destroy
  acts_as_list scope: :collection
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  scope :highlights, -> { where(highlight: true) }
  scope :non_highlights, -> { where(highlight: false) }
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :videos, reject_if: :all_blank, allow_destroy: true
end
