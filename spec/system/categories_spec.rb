require "rails_helper"
require_relative "../support/devise"

RSpec.describe "User Auth", type: :system do
  include Devise::Test::IntegrationHelpers
  before do
  # by default we are using GUI
  # driven_by :selenium, using: :headless_chrome
  # driven_by(:rack_test)
  end

  it "sign in and create new category" do
    visit root_path
    user = FactoryBot.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    expect(page).to have_content("Categories")

    visit new_category_path
    expect(page).to have_content("New Category")

    fill_in "category_name", with: "New Category from rspec"
    click_on "Create Category"
    expect(page).to have_content("New Category from rspec")
  end
end
