p "Destroying previous seeds"
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
  artist.remote_video_url = 'https://www.videezy.com/download/5923?download_auth_hash=ce742c98&pro=false'
  artist.save!
  count += 1
  3.times do
    resume_block = ResumeBlock.create!(
      artist: artist,
      title: Faker::Lorem.word
    )
    3.times do
      ResumeItem.create!(
        resume_block: resume_block,
        description: Faker::Lorem.word,
        label: Faker::Lorem.word,
        year: Faker::Date.backward(2000)
      )
    end
  end
end
