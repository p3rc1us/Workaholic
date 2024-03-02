require "application_system_test_case"


class CategoriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "sing in page" do
    visit root_path, wait: 10
  end
end
