FactoryBot.define do
  factory :question do
  end
  factory :portuguese_question_1, parent: :question do
    association :round
    association :portuguese_category
    description { 'o que é crase?' }
  end
end
