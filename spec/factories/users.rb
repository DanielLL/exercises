# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "test_name"
    last_name "test_last_name"
    mail "test_mail"
    password "test_password"
  end
end
