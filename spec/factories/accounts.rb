FactoryBot.define do
  factory :account do
    association :company
    name { 'Account Name' }
  end
end
