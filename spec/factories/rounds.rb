FactoryBot.define do
  factory :round do
  end
  factory :rounds_1, parent: :round do
    association :player
  end
end
