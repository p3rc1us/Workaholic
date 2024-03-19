require "rails_helper"
require_relative "../support/devise"

RSpec.describe "User Auth", type: :system do
  include Devise::Test::IntegrationHelpers
  before do
  # by default we are using GUI
  # driven_by :selenium, using: :headless_chrome
  # driven_by(:rack_test)
  end

  it "sign up" do
    visit new_user_registration_path
    user = FactoryBot.create(:user)

    fill_in "Email", with: "signup-#{user.email}"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign up"

    expect(page).to have_content("Categories")
    click_on "Logout"
  end

  it "sign in and create category" do
    visit root_path
    user = FactoryBot.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    expect(page).to have_content("Categories")

    visit new_category_path
    expect(page).to have_content("New Category")
    cat = FactoryBot.create(:category, user: user)

    fill_in "category_name", with: cat.name
    click_on "Create Category"
    expect(page).to have_content(cat.name)

    click_on "Logout"
  end
end
