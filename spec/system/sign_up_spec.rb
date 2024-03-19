require "rails_helper"


RSpec.describe "User Auth", type: :system do
  include Devise::Test::IntegrationHelpers

  it "sign up" do
    visit new_user_registration_path
    user = FactoryBot.create(:user)

    fill_in "Email", with: "signup_#{user.email}"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Sign up"

    expect(page).to have_content("Categories")
    click_on "Logout"
  end
end
