# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    floor 1
    letter ""
    number_of_bathrooms 1
    price "9.99"
    outdoor_square_feet 1
    outdoor_square_feet 1
    floorplan "MyString"
  end
end
