require "rails_helper"

RSpec.describe "CRUD category", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:cat) { FactoryBot.create(:category, user: user) }

  before do
  # WARNING! this test is meant for headless & rack, to showcase performance and Nyan cat.
  driven_by :selenium, using: :headless_chrome
  # driven_by(:rack_test)
  end

  context "CRUD category" do
    before do
      sign_in
    end

    it "create category" do
      visit new_category_path
      expect(page).to have_content("New Category")
      fill_in "category_name", with: cat.name
      click_on "Create Category"
      expect(page).to have_content(cat.name)
    end

    it "update category" do
      visit edit_category_path(cat)
      expect(page).to have_content("New Category")
      fill_in "category_name", with: "#{cat.name} update"
      click_on "Update Category"
      expect(page).to have_content("#{cat.name} update")
    end

    it "delete category" do
      visit category_path(cat)
      expect(page).to have_content(cat.name)
      click_on "Delete Category"
      expect(page).to_not have_content("cat.name")
    end
  end

  private

  def sign_in
    visit root_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
    expect(page).to have_content("Categories")
  end
end
