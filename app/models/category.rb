class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  # scope :today, -> { where(created_at == Date.current.beginning_of_day..Date.current.end_of_day) }
end
