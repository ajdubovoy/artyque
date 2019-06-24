FactoryBot.define do
  factory :resume_item do
    resume_block { nil }
    description { "MyString" }
    label { "MyString" }
    year { "MyString" }
    highlight { false }
    position { 1 }
  end
end
