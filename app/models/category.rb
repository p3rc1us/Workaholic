class Category < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    %w(name)
  end

  def self.ransackable_associations(auth_object = nil)
    ["tasks", "user"]
  end

  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  # scope :today, -> { where(created_at == Date.current.beginning_of_day..Date.current.end_of_day) }
end
