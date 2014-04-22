FactoryGirl.define do
  factory :order do
    customer_name 'Sally Jones'
    customer_email 'sally@jones.com'
    description 'Fancy order'
    price 1600
    frame
  end
end
