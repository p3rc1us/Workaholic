require "application_system_test_case"


class CategoriesTest < ApplicationSystemTestCase
  # setup do
  #   @user = users(:user_one)
  # end

  test "l" do
    visit root_path

    assert_selector "span", text: "Categories", wait: 10
  end
end
