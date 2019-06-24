class ResumeItem < ApplicationRecord
  belongs_to :resume_block
  acts_as_list scope: :resume_block
end
