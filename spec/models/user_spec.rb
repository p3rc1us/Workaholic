require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do

    it "have many categories" do
      expect(User.reflect_on_association(:categories).macro).to eq(:has_many)
    end
  end
end
