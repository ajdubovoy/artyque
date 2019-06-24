class UpcomingProject < ApplicationRecord
  belongs_to :artist
  validates_with DescriptionWordLengthValidator
  validates :title, presence: true
end
