FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "example#{i}i@example.com" }
    sequence(:password) { |i| "password#{i}" }
    sequence(:password_confirmation) { |i| "password#{i}" }
    token { "abcde" }
  end
end
