class HomepageController < ApplicationController
  def show
    @unpaid_orders = Order.unpaid.count
  end
end
