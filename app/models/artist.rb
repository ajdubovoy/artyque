class Artist < ApplicationRecord
  belongs_to :user
  has_many :resume_blocks, -> { order(position: :asc) }, dependent: :destroy
  has_many :resume_items, -> { order(position: :asc) }, through: :resume_blocks
  alias_attribute :items, :resume_items
  alias_attribute :blocks, :resume_blocks
  has_many :upcoming_projects, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :artworks, through: :collections
  enum color_palette: %i[ plain angular curved ]
  validates :layout, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :shape, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :button_text, length: { maximum: 30 }
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
