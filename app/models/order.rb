class Order < ActiveRecord::Base
  validates :customer_name, :customer_email, :description, :price, presence: true

  def self.unpaid
    where(paid_for_on: nil)
  end
end
