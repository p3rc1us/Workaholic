FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" } #email { 'test@example.com' }
    password { "123456" }
  end

  # factory :category do
  #   category_name { "New Category from rspec" }
  # end
end
