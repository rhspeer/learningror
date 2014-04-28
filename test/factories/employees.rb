# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    email 'employee@example.com'
    password 'password'
  end
end
