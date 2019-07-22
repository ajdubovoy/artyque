FactoryBot.define do
  factory :video do
    artwork { nil }
    url { "https://vimeo.com/150814182" }
    position { 1 }
    trait :youtube do
      url { "https://www.youtube.com/watch?v=THPREWK64xI" }
    end
  end
end

