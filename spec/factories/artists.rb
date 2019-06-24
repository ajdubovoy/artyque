FactoryBot.define do
  factory :artist do
    user { nil }
    color_palette { 1 }
    shape { 1 }
    super_title { "MyString" }
    title { "MyString" }
    description { "MyString" }
    button_text { "MyString" }
    layout { 1 }
    video { "MyString" }
    quotation { "MyString" }
    quotation_caption { "MyString" }
    photo { "MyString" }
    about_me { "MyString" }
  end
end
