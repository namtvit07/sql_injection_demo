20.times do
  FactoryGirl.create(:user)
end

User.last.update(is_admin: true)

30.times do
  FactoryGirl.create(:post)
end