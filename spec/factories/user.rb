FactoryGirl.define do

  factory :user do
    name { Faker::Name.name }
    email_address { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state 'CA'
    zip_code { Faker::AddressUS.zip_code }
    tos_acceptance true
  end

end