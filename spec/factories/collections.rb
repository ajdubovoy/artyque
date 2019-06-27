FactoryBot.define do
  factory :collection do
    artist { nil }
    name { "MyString" }
    after :create do |collection|
      create_list :artwork, 3, collection: collection
    end
  end
end
