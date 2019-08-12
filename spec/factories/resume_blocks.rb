FactoryBot.define do
  factory :resume_block do
    artist { nil }
    title { "MyString" }
    position { 1 }
    after :create do |resume_block|
      create_list :resume_item, 3, resume_block: resume_block
    end
  end
end
