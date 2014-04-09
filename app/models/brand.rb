class Brand < ActiveRecord::Base

  has_many :orders

  scope :active, -> { where(active: true)}

end
