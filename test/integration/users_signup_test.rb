require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "acda",
                                         email: "user@invalid",
                                         password:              "foofoo",
                                         password_confirmation: "foofoo" } }
    end
    assert_template 'users/new'
    assert_select 'div.error_explanation'
  end
end