FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :admin do
      role { 'admin' }
    end

    trait :artist do
      role { 'artist' }
    end

    trait :gallery do
      role { 'gallery' }
    end

    trait :unauthorized do
      role { 'unauthorized' }
    end

    trait :collector do
      role { 'collector' }
    end
  end
end
