require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { Category.new(user: user) }

  context 'Validations' do

    it 'must be invalid' do
      category.name = nil

      expect(category).to_not be_valid
      expect(category.errors).to be_present
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'must be Valid' do
      category.name = "AvionSchool"

      expect(category).to be_valid
      expect(category.errors).to_not be_present
    end
  end

  # testing associations using shoulda gem
  describe Category do
    it { should belong_to(:user) }
    it { should have_many(:tasks) }
  end

  # testing associations w/o shoulda gem
  # context 'Associations' do

  #   it "have many tasks" do
  #     expect(Category.reflect_on_association(:tasks).macro).to eq(:has_many)
  #   end

  #   it "belongs to User" do
  #     expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
  #   end
  # end

end
