FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    password { "123456" }
  end

  factory :category do
    sequence(:name) { |x| "Category rspec #{x}" }
  end
end
