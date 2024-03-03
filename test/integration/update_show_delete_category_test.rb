require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
test "update_show_delete_category" do
  #update

   sign_in users(:one)

   get edit_category_path(categories(:one))
   assert_response :success

   patch category_path, params: {
     category: {
       name: "updating a category"
     }
   }
   assert :redirect
   follow_redirect!
   assert_response :success

   #show

   get category_path(categories(:one))
   assert_response :success

   assert_select "h1", text: "UPDATING A CATEGORY"

   #delete

   delete category_path(categories(:one))

 end
end
