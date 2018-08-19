FactoryBot.define do
  factory :shop do
    sequence(:shopify_domain) { |i| "#{i}Domain" }
    shopify_token "MyString"
  end
end
