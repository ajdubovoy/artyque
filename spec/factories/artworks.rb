FactoryBot.define do
  factory :artwork do
    collection { nil }
    name { "MyString" }
    description { "MyString" }
    width { 1 }
    height { 1 }
    depth { 1 }
    year { 1 }
    medium { "MyString" }
    price { 1 }
    weight { 1 }
    highlight { false }
    trait :invalid do
      name { '' }
    end
  end
end
