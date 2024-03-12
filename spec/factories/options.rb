FactoryBot.define do
  factory :option do
  end
  factory :portuguese_option1_q1, parent: :option do
    association :answer, factory: :answer_question_1
    label { 'frase' }
  end

  factory :portuguese_option2_q1, parent: :option do
    label { 'adjetivo' }
  end

  factory :portuguese_option3_q1, parent: :option do
    label { 'verbo' }
  end

  factory :portuguese_option4_q1, parent: :option do
    label { 'acento' }
    correct { true }
  end
end
