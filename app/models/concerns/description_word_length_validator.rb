class DescriptionWordLengthValidator < ActiveModel::Validator
  def validate(record)
    return unless record.description

    if record.description.split.size > 300
      record.errors.add(:description, "You must have less than 300 words")
    end
  end
end
