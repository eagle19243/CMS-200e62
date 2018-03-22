# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :press_clipping do
    blurb "MyText"
    source "MyString"
    url "MyString"
    image ""
  end
end
