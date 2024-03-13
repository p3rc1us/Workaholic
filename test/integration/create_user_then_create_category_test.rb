require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
  test "create_user_account_then_create_category" do
    #create user

    get new_user_registration_path
    assert_response :success

    post user_registration_path, params: {
      user: {
        email: "testfromIntegrationTest@mail.com",
        password: "123456",
        password_confirmation: "123456"
      }
    }
    assert :redirect
    follow_redirect!

    #proceed to create category

    post categories_path, params: {
      category: {
        name: "test category"
      }
    }
    assert :redirect
    follow_redirect!
    assert_response :success

    assert_select "h1", text: "TEST CATEGORY" #I upcase my category.name
  end


end
