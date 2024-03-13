FactoryBot.define do
  factory :answer do
  end

  factory :answer_question_1, parent: :answer do
    association :round, factory: :rounds_1
    association :option, factory: :portuguese_option1_q1
    association :question, factory: :portuguese_question_1
  end
end
