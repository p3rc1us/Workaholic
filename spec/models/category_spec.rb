require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:avion) { Category.new(user: user) }

  context 'Validations' do
    it 'must be invalid' do
      avion.name = nil

      expect(avion).to_not be_valid
      expect(avion.errors).to be_present
      expect(avion.errors[:name]).to include("can't be blank")
    end

    it 'must be Valid' do
      avion.name = "AvionSchool"

      expect(avion).to be_valid
      expect(avion.errors).to_not be_present
    end
  end
end
