FactoryGirl.define do
  factory :post do
    title { Forgery('lorem_ipsum').words(50).split.shuffle.first(5).join(' ') }
    description { Forgery('lorem_ipsum').words(100).split.shuffle.first(10).join(' ') }
    content { Forgery('lorem_ipsum').paragraphs(51).split("\n\n").shuffle.first(20).join("\n\n") }
    user { User.offset(rand(User.count)).first }
  end
end