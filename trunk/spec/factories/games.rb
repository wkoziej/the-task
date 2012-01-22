
FactoryGirl.define do

  factory :game do
    creator
    title 'Game title'
    description 'Game description'
    after_create { |game| FactoryGirl.create(:capture_code, :game => game, :description => "AAAA") }
  end

end
