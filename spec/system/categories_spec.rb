require "rails_helper"
require_relative "../support/devise"

RSpec.describe "User Auth", type: :system do
  include Devise::Test::IntegrationHelpers
  before do
  # by default we are using GUI
  # driven_by :selenium, using: :headless_chrome
  # driven_by(:rack_test)
  end

  it "from login user" do
    visit root_path
    user = FactoryBot.create(:user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    expect(page).to have_content("Categories")
  end
end
