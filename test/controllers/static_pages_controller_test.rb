require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "RandomFood - "
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@base_title}Home" # RandomFood - Home
  end

end
