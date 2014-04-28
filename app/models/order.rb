class Order < ActiveRecord::Base
  include ActiveModel::Transitions

  belongs_to :frame
  has_one :brand, through: :frame

  validates :customer_name, :customer_email, :description, :price, :frame_id, presence: true
  validate :completion_date_must_be_in_the_past

  scope :unfinished, -> { where(completed_on: nil) }

  state_machine do
    state :new
    state :paid
    state :completed

    event :pay do
      transitions :from => :new, :to => :paid, :on_transition => :mark_paid
    end

    event :complete do
      transitions :from => :paid, :to => :completed, :on_transition => :mark_completed
    end
  end

  def self.paid
    where.not(paid_for_on: nil)
  end

  def self.unpaid
    where(paid_for_on: nil)
  end

  def brand_id
    brand ? brand.id : nil
  end

  private

  def completion_date_must_be_in_the_past
    errors.add(:completed_on, 'should not be in the future.') if completed_on && completed_on > Time.now
  end

  def mark_completed
    order.completed_on = Time.now
    order.save!
  end

  def mark_paid
    order.paid_for_on = Time.now
    order.save!
  end
end
