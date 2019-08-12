class ResumeBlock < ApplicationRecord
  belongs_to :artist
  has_many :resume_items, -> { order(position: :asc) }, dependent: :destroy
  alias_attribute :items, :resume_items
  acts_as_list scope: :artist
  validates :title, presence: true
  accepts_nested_attributes_for :resume_items, reject_if: :all_blank, allow_destroy: true
end
