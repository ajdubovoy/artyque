class ResumeBlock < ApplicationRecord
  belongs_to :artist
  has_many :resume_items, -> { order(position: :asc) }
  acts_as_list scope: :artist
end
