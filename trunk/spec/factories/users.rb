# This will guess the User class
FactoryGirl.define do

  factory :user do
    email "sample1@domain.com"
    login 'login1'
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

  factory :winner, :class => User, :parent => :user do
    email "winner@domain.com"
    login 'winner'
  end
  
end
