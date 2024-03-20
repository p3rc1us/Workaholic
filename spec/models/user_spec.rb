require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do

    it "have many categories" do
      expect(User.reflect_on_association(:categories).macro).to eq(:has_many)
    end

    it "have many tasks through categories" do
      expect(User.reflect_on_association(:tasks).macro).to eq(:has_many)
      expect(User.reflect_on_association(:tasks).through_reflection.name).to eq(:categories)
    end
  end
end
