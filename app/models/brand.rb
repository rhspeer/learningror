class Brand < ActiveRecord::Base
  has_many :frames
  has_many :orders, through: :frames

  scope :active, -> { where(active: true)}

  def paid_but_incomplete_orders
    orders.paid.unfinished
  end

end
