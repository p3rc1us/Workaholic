require 'rails_helper'

RSpec.describe "Categories", type: :system do
  # let(:user) { create(:user) }

  before do
    driven_by(:selenium, using: :chrome, screen_size: [1400, 1400])
    # driven_by :selenium, using: :headless_chrome
    # driven_by(:rack_test)
  end

  # before :each do
  #   sign_in user
  # end

  it "sign in" do
    visit root_path
    expect(page).to have_content('Workaholic')
  end

end
