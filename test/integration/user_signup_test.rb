require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "get signup form and signup" do
     get "/signup"
     assert_response :success
     assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "test_user", email: "test@example.com", password: "password"} }
      assert_response :redirect
     end
     follow_redirect!
     assert_response :success
     assert_match "test_user", response.body 
   end

end
