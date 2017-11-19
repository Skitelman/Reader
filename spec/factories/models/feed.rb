FactoryBot.define do
  factory :feed do
    name Faker::Lorem.word
    url Faker::Internet.url("www.blog.com")
    description Faker::Lorem.sentence
  end
end