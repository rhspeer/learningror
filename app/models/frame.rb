class Frame < ActiveRecord::Base
  belongs_to :brand
  has_many :orders

  validates :brand_id, presence: true
end
