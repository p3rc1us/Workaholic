require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  it "can visit homepage" do
    visit root_path
  end
end
