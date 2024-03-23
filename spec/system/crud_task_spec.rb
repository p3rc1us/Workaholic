require "rails_helper"

RSpec.describe "CRUD task", type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    # by default we are using GUI
    # driven_by :selenium, using: :headless_chrome
    # driven_by(:rack_test)
    sign_in
  end

  let(:user) { FactoryBot.create(:user) }

  it "create category and create task" do
    visit new_category_path
    expect(page).to have_content("New Category")
    cat = FactoryBot.create(:category, user: user)

    fill_in "category_name", with: cat.name
    click_on "Create Category"
    expect(page).to have_content(cat.name)

    visit new_category_task_path(cat)
    expect(page).to have_content("New Task")
    tas = FactoryBot.create(:task, category: cat)

    fill_in "task_name", with: tas.name
    click_on "Create Task"
    expect(page).to have_content(tas.name)
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
