class Artwork < ApplicationRecord
  belongs_to :collection
  validates_with DescriptionWordLengthValidator
end
