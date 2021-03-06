class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  belongs_to :featured_artwork, class_name: 'Artwork', optional: true, foreign_key: :featured_artwork_id
  has_many :resume_blocks, -> { order(position: :asc) }, dependent: :destroy
  has_many :resume_items, -> { order(position: :asc) }, through: :resume_blocks
  alias_attribute :items, :resume_items
  alias_attribute :blocks, :resume_blocks
  has_many :upcoming_projects, -> { order(position: :asc) }, dependent: :destroy
  has_many :links, -> { order(position: :asc) }, dependent: :destroy
  has_many :collections, -> { order(position: :asc) }, dependent: :destroy
  has_many :artworks, through: :collections
  enum shape: %i[ plain angular curved ]
  accepts_nested_attributes_for :resume_blocks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :collections, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :upcoming_projects, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :user # Only for admin!
  validates :color_palette, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :layout, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  validates :button_text, length: { maximum: 30 }
  validates_with DescriptionWordLengthValidator
  validates :name, presence: true
  validates :video, format: /\Ahttps?:\/\/((www\.)?vimeo\.com\/|(www\.)?youtu\.be\/|(www\.)?youtube\.com\/watch\?v=)(?<id>.+)\z/, allow_blank: true
  mount_uploader :photo, PhotoUploader
  mount_uploader :transparent_photo, PhotoUploader

  def vimeo?
    return video.match?(/\Ahttps?:\/\/(www\.)?vimeo\.com\/(?<id>.+)\z/)
  end

  def resume?
    return resume_blocks.present?
  end
end
