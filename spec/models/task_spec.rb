require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { Category.new(user: user) }
  let!(:task) { Task.new(category: category) }

  context 'Validations' do

    it "must be invalid" do
      task.name = nil

      expect(task).to_not be_valid
      expect(task.errors).to be_present
      expect(task.errors[:name]).to include("can't be blank")
    end

    it "must be valid" do
      task.name = "Attend Avionschool class"

      expect(task).to be_valid
      expect(task.errors).to_not be_present
    end
  end
end