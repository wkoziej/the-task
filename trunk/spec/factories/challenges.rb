
FactoryGirl.define do

  factory :challenge, :class => Challenge do
    point_kind
    points 10
    title { "Challange #{type}" }
    description { "Descritpion #{type}" }
  end


  factory :capture_code, :parent => :challenge, :class => CaptureCode do
  end

  factory :enter_message, :parent => :challenge, :class => EnterMessage do
  end

end
