require 'rails_helper'

RSpec.describe Category, type: :model do

  let!(:avion) { Category.new }

  context 'Validations' do
    it '1. Must be invalid without a name' do
      avion.name = nil

      expect(avion).to_not be_valid
      expect(avion.errors).to be_present
      expect(avion.errors[:name]).to include("can't be blank")
    end
  end
end
