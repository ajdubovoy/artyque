class Link < ApplicationRecord
  belongs_to :artist
  validates_with DescriptionWordLengthValidator
end
