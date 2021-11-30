FactoryBot.define do
  factory :post, aliases: [:item] do
    name { 'Test post' }
    body { 'Content for test post' }
  end
end
