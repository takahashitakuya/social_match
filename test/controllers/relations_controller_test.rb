require 'test_helper'

class RelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get relations_new_url
    assert_response :success
  end

end
