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
  validate :validate_description_word_length
  validates :button_text, length: { maximum: 30 }

  def validate_description_word_length
    return unless description

    if description.split.size > 300
      errors.add(:base, "You must have less than 300 words")
    end
  end
end
