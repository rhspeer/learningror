class Frame < ActiveRecord::Base
  belongs_to :brand
  has_many :frames

  validates :brand_id, presence: true
end
