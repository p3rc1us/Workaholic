require "rails_helper"

RSpec.describe "CRUD task", type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    # by default we are using GUI
    driven_by :selenium, using: :headless_chrome
    # driven_by(:rack_test)
  end

  it "sign in, create category and create task" do
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

  end
end
