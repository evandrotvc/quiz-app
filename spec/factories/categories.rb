FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
  end

  factory :mathematic_category, parent: :category do
    name { 'mathematics' }
  end
end

FactoryBot.define do
  factory :history_category, parent: :category do
    name { 'history' }
  end
end

FactoryBot.define do
  factory :portuguese_category, parent: :category do
    name { 'portuguese' }
  end
end
