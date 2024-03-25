require "rails_helper"

RSpec.describe "CRUD task", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:cat) { FactoryBot.create(:category, user: user) }
  let(:tas) { FactoryBot.create(:task, category: cat) }

  before do
    # by default we are using GUI
    # driven_by :selenium, using: :headless_chrome
    # driven_by(:rack_test)
  end

  context "CRUD task" do
    before do
      sign_in
      create_category
    end

    it "create task" do
      find(".new-task-button").click
      expect(page).to have_content("New Task")
      fill_in "task_name", with: tas.name
      click_on "Create Task"
      expect(page).to have_content(tas.name)
    end

    it "update task" do
      create_task

      find(".edit-task").click
      expect(page).to have_content("Edit Task")
      fill_in "task_name", with: "#{tas.name} update"
      click_on "Update Task"
      expect(page).to have_content("#{tas.name} update")
    end

    it "delete task" do
      create_task
      click_on "Delete task"
      within '.right.pane' do
        expect(page).to_not have_content(tas.name)
      end
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

  def create_category
    find(".new-button").click
    expect(page).to have_content("New Category")

    fill_in "category_name", with: cat.name
    click_on "Create Category"
    expect(page).to have_content(cat.name)
  end

  def create_task
    find(".new-task-button").click
    expect(page).to have_content("New Task")
    fill_in "task_name", with: tas.name
    click_on "Create Task"
    expect(page).to have_content(tas.name)
  end
end
