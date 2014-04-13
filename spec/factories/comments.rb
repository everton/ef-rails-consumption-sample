# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user "MyString"
    text "MyString"
    video_id 1
  end
end
