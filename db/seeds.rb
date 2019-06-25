Artist.destroy_all
User.destroy_all

p 'Seeding users'
User.create(email: 'admin@artyque.com', password: '123456', role: :admin)
User.create(email: 'unauthorized@artyque.com', password: '123456', role: :unauthorized)
User.create(email: 'gallery@artyque.com', password: '123456', role: :gallery)
User.create(email: 'collector@artyque.com', password: '123456', role: :collector)

p "Seeding Artists"
count = 1
5.times do
  user = User.create(email: "artist#{count}@artyque.com", password: '123456', role: :artist)
  Artist.create(
    user: user,
    color_palette: %w[plain angular curved].sample,
    shape: [1, 2, 3].sample,
    super_title: Faker::Lorem.sentence(3),
    title: Faker::Lorem.sentence(5),
    description: Faker::Lorem.sentences(3).join,
    button_text: Faker::Lorem.word,
    layout: [1, 2, 3].sample,
    video: 'test.mp4',
    quotation: Faker::Quote.most_interesting_man_in_the_world,
    quotation_caption: Faker::GreekPhilosophers.name,
    photo: 'test.jpg',
    about_me: Faker::Lorem.paragraph,
    name: Faker::Name.name
  )
  count += 1
end
