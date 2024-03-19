FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "rspec-#{n.to_s.rjust(3, "0")}@email.com" }
    password { "123456" }
  end

  factory :category do
    sequence(:name) { |x| "Category rspec #{x}" }
  end
end
