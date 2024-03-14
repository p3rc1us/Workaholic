require 'rails_helper'

RSpec.describe "Categories", type: :system do
  before do
    # driven_by(:selenium, using: :chrome, screen_size: [1400, 1400])
    driven_by :selenium, using: :headless_chrome
  end

  it "can visit homepage" do
    visit root_path
    expect(page).to have_content('Workaholic')
  end

end
