class Order < ActiveRecord::Base
  validates :customer_name, :customer_email, :description, :price, presence: true
end
