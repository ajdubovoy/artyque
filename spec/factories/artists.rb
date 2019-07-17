FactoryBot.define do
  factory :artist do
    association :user, factory: :user, role: :artist
    shape { %w[plain angular curved].sample }
    color_palette { [1, 2, 3].sample }
    super_title { Faker::Lorem.sentence(3) }
    title { Faker::Lorem.sentence(5) }
    description { Faker::Lorem.sentences(3).join }
    button_text { Faker::Lorem.word }
    layout { [1, 2, 3].sample }
    video { "" }
    quotation { Faker::Quote.most_interesting_man_in_the_world }
    quotation_caption { Faker::GreekPhilosophers.name }
    photo { "" }
    about_me { Faker::Lorem.paragraph }
    name { Faker::Name.name }
    after :create do |artist|
      create_list :resume_block, 3, artist: artist
      create_list :link, 3, artist: artist
      create_list :upcoming_project, 3, artist: artist
      create_list :collection, 3, artist: artist
    end
    trait :invalid do
      name { "" }
    end
  end
end
