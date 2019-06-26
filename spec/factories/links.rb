FactoryBot.define do
  factory :link do
    artist { nil }
    title { "MyString" }
    description { "MyString" }
    url { Faker::Internet.url }
    year { 1 }
    photo { "test.jpg" }
  end
end
