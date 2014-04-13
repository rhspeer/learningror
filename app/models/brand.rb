class Brand < ActiveRecord::Base

  has_many :frames

  scope :active, -> { where(active: true)}

end
