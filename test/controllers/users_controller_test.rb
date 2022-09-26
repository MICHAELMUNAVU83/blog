require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'index action should be success' do
    get :'/users'
    assert_response :success
  end
end
