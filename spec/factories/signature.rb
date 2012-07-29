FactoryGirl.define do

  factory :signature do
    association :user
    association :proposition
  end

end