FactoryBot.define do
  factory :collection do
    artist { nil }
    name { Faker::Name.name }
    trait :invalid do
      name { '' }
    end
    after :create do |collection|
      create_list :artwork, 3, collection: collection
    end
  end
end
