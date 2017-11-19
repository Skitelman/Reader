FactoryBot.define do
  factory :entry do
    title Faker::Lorem.sentence
    url Faker::Internet.url
    author Faker::Name.name
    summary Faker::Lorem.paragraph
    content Faker::Lorem.paragraph(3)
    image_url Faker::LoremPixel.image
    feed
  end
end