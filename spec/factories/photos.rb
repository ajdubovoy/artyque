FactoryBot.define do
  factory :photo do
    artwork { nil }
    attachment { "test.jpg" }
    position { 1 }
  end
end
