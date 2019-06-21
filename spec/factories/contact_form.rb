require 'factory_bot_rails'
require 'faker'

FactoryBot.define do
  factory :contact_form do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { ['artist', 'gallery', 'collector'].sample }
    email { Faker::Internet.email }
    website { Faker::Internet.url }
    message { Faker::Lorem.sentence }

    trait :invalid do
      email { '' }
    end

    trait :spam do
      nickname { 'I am spam, spam I am' }
    end
  end
end
