FactoryBot.define do
  factory :news_post do
    headline { "MyString" }
    content { "MyText" }
  end

  trait :invalid do
    headline { "" }
  end
end
