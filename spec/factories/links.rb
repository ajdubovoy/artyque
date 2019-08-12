FactoryBot.define do
  factory :link do
    artist { nil }
    title { "MyString" }
    description { "MyString" }
    url { "https://www.apple.com" }
    year { 1 }
    trait :invalid do
      title { '' }
      url { 'totally invalid url' }
    end
  end
end
