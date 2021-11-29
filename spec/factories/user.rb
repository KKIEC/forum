FactoryBot.define do
  factory :user do
    name { 'Test user' }
    email { 'test@example.com' }
    password { 'xxxxxxxx' }
  end
end
