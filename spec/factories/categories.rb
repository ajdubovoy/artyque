FactoryBot.define do
  factory :category do
    name { "MyString" }
    trait :invalid do
      name { "" }
    end
  end
end
