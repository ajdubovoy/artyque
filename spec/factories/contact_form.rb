factory :contact_form do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  website { Faker::Internet.url }
  message { Faker::Lorem.sentence }

  trait :invalid do
    email { '' }
  end
end
