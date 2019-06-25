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
  user = User.create!(email: "artist#{count}@artyque.com", password: '123456', role: :artist)
  artist = Artist.create(
    user: user,
    shape: %i[plain angular curved].sample,
    color_palette: [1, 2, 3].sample,
    super_title: Faker::Lorem.sentence(3),
    title: Faker::Lorem.sentence(5),
    description: Faker::Lorem.sentences(3).join,
    button_text: Faker::Lorem.word,
    layout: [1, 2, 3].sample,
    video: 'test.mp4',
    quotation: Faker::Quote.most_interesting_man_in_the_world,
    quotation_caption: Faker::GreekPhilosophers.name,
    about_me: Faker::Lorem.paragraph,
    name: Faker::Name.name
  )
  artist.remote_photo_url = 'https://unsplash.com/photos/hE8Mog4qK4Y/download?force=true'
  artist.save!
  artist.remote_video_url = 'https://gcs-vimeo.akamaized.net/exp=1561483082~acl=%2A%2F722787376.mp4%2A~hmac=3f97e322b701a557317b025ea9f0ddbfe514e8777575b1cd819eb3b9ed9c49ac/vimeo-prod-skyfire-std-us/01/2150/8/210754313/722787376.mp4?download=1&filename=Pexels+Videos+2916.mp4'
  artist.save!
  count += 1
end
