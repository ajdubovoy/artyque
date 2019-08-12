FactoryBot.define do
  factory :upcoming_project do
    artist { nil }
    title { "MyString" }
    description { "MyString" }
    location { "MyString" }
    date { "MyString" }
    photo { "test.jpg" }

    trait :invalid do
      title { '' }
    end
  end
end
