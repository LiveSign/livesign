propositions = FactoryGirl.create_list(:proposition, 10)
users = FactoryGirl.create_list(:user, 30)

# Ensure a subset of users sign each petition
propositions.each do |p|

  users.sample(10).each do |u|
    FactoryGirl.create(:signature, user_id: u.id, proposition_id: p.id)
  end

end

# Ensure we have a few petitions without any signatures
FactoryGirl.create_list(:proposition, 5)