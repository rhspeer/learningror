class Frame < ActiveRecord::Base
  belongs_to :brand
  has_many :frames
end
