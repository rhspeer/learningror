require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  test "should get show" do
    employee = FactoryGirl.create(:employee)
    sign_in(employee)
    get :show
    assert_response :success
  end

end
