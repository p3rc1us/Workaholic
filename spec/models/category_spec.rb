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

  context 'Associations' do

    it "have many tasks" do
      expect(Category.reflect_on_association(:tasks).macro).to eq(:has_many)
    end

    it "belongs to User" do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end

end
