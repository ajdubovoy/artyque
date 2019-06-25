FactoryBot.define do
  factory :artist do
    association :user, factory: :user, role: :artist
    color_palette { %w[plain angular curved].sample }
    shape { [1, 2, 3].sample }
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
  end
end
