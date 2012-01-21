# This will guess the User class
FactoryGirl.define do

  factory :user do
    email "sample@domain.com"
    login 'login'
    password 'secret'
  end

  factory :creator, :class => User, :parent => :user do
    email "game_creator@domain.com"
    login 'game_creator'
  end

  factory :sponsor, :class => User, :parent => :user do
    email "sponsor@domain.com"
    login 'sponsor'
  end
  
end
