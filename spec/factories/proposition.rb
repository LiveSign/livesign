FactoryGirl.define do

  factory :proposition do
    association :user
    title { Faker::HipsterIpsum.words(5).join(" ").capitalize + "." }
    overview { Faker::HipsterIpsum.words(20).join(" ").capitalize + "." }
    full { Faker::Lorem.paragraph(12) }
    state 'CA'
  end

end