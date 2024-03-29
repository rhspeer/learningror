require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = FactoryGirl.create(:order)
    employee = FactoryGirl.create(:employee)
    sign_in(employee)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    frame = FactoryGirl.create(:frame)
    assert_difference('Order.count') do
      post :create, order: {
        customer_email: @order.customer_email,
        customer_name: @order.customer_name,
        description: @order.description,
        paid_for_on: @order.paid_for_on,
        price: @order.price,
        frame_id: frame.id
      }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { customer_email: @order.customer_email, customer_name: @order.customer_name, description: @order.description, paid_for_on: @order.paid_for_on, price: @order.price }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  test "should mark order paid" do
    assert_nil @order.paid_for_on
    post :mark_paid, id: @order

    @order.reload
    assert_not_nil @order.paid_for_on
  end

  test "should mark order completed" do
    assert_nil @order.completed_on
    @order.pay!
    post :mark_completed, id: @order

    @order.reload
    assert_not_nil @order.completed_on
  end

  test "should not allow directly setting paid_for_on" do
    assert_date_field_not_updatable :paid_for_on
  end

  test "should not allow directly setting completed_on" do
    assert_date_field_not_updatable :completed_on
  end

  def assert_date_field_not_updatable(field)
    assert_nil @order.send(field)  # Sanity check: this test assumes date field is nil
    patch :update, id: @order, order: { field => Time.now }

    @order.reload
    assert_nil @order.send(field), "Client directly updated #{field}"
  end

  test "should not mark order completed if it is not paid" do
    assert_raise(Transitions::InvalidTransition) do
      post :mark_completed, id: @order
    end

    @order.reload
    assert_nil @order.completed_on
  end
end
