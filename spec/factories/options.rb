FactoryBot.define do
  factory :option do
  end
  factory :portuguese_option1_q1, parent: :option do
    association :question, factory: :portuguese_question_1
    label { 'frase' }
  end

  factory :portuguese_option2_q1, parent: :option do
    association :question, factory: :portuguese_question_1
    label { 'adjetivo' }
  end

  factory :portuguese_option3_q1, parent: :option do
    association :question, factory: :portuguese_question_1
    label { 'verbo' }
  end

  factory :portuguese_option4_q1, parent: :option do
    association :question, factory: :portuguese_question_1
    label { 'acento' }
  end
end
