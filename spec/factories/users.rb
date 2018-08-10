FactoryBot.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end
  factory :user, aliases: [:author] do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
