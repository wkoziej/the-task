FactoryGirl.define do

  factory :reward do
    point_kind
    price_in_points 10
    description { "Descritpion of reward" }
    association :creator, :method => :build
    association :sponsor, :method => :build
  end

  factory :car, :class => Reward, :parent => :reward do
    price_in_points 10000
    description { "The best car" }
  end
  
end
