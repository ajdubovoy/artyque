class Artist < ApplicationRecord
  belongs_to :user
  has_many :resume_blocks, -> { order(position: :asc) }
  has_many :resume_items, -> { order(position: :asc) }, through: :resume_blocks
  has_many :upcoming_projects
  has_many :links
  has_many :collections
  has_many :artworks, through: :collections
  enum color_palette: %i[ plain angular curved ]
  validates :color_palette, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :layout, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :button_text, length: { maximum: 30 }
  validates_with DescriptionWordLengthValidator
end
