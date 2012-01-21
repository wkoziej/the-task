# This will guess the Game class
#require 'spec/factories/point_kinds'

FactoryGirl.define do

  # factory :creator, :class => User do
  #   email "game_creator@domain.com"
  #   login 'game_creator'
  #   password 'secret'
  # end

#  factory :point_kind do
#    name 'Public'
#  end

  factory :challange do
    point_kind
    points 10
    title { "Challange #{type}" }
    description { "Descritpion #{type}" }
  end


  factory :game do
    creator
#    status :new
    title 'Game title'
    description 'Game description'
  end

  factory :capture_code, :class => CaptureCode do
    game
  end
  
  factory :enter_message, :class => EnterMessage do
    game
  end
  
end
