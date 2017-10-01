FactoryGirl.define do
  factory :user do
    email { Forgery::Internet.email_address }
    name  { Forgery::Name.full_name }
    password { Forgery::Basic.password }
    national_id { "#{rand(100000000..999999999)}" }
    birthday { "#{rand(1980..2010)}-#{rand(1..12)}- #{rand(1..28)}" }
    phone { "0909#{rand(100000..999999)}" }
    sequence :address { |n| "Address #{n}" }
    is_admin false
  end
end