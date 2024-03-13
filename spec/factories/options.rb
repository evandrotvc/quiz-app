FactoryBot.define do
  factory :option do
  end
  factory :portuguese_option1_q1, parent: :option do
    # association :question, factory: :portuguese_question_1
    label { 'frase' }
  end

  factory :portuguese_option2_q1, parent: :option do
    # association :question, factory: :portuguese_question_1
    label { 'adjetivo' }
  end

  factory :portuguese_option3_q1, parent: :option do\
    # association :question, factory: :portuguese_question_1
    label { 'verbo' }
  end

  factory :portuguese_option4_q1, parent: :option do
    # association :question, factory: :portuguese_question_1
    label { 'acento' }
    correct { true }
  end

  factory :portuguese_option1_q2, parent: :option do
    # association :question, factory: :portuguese_question_2
    label { 'complemento' }
  end

  factory :portuguese_option2_q2, parent: :option do
    # association :question, factory: :portuguese_question_2
    label { 'qualidade' }
  end

  factory :portuguese_option3_q2, parent: :option do
    # association :question, factory: :portuguese_question_2
    label { 'sujeito' }
  end

  factory :portuguese_option4_q2, parent: :option do
    # association :question, factory: :portuguese_question_2
    label { 'ação' }
    correct { true }
  end

  factory :portuguese_option1_q3, parent: :option do
    # association :question, factory: :portuguese_question_3
    label { 'complemento' }
  end

  factory :portuguese_option2_q3, parent: :option do
    # association :question, factory: :portuguese_question_3
    label { 'qualidade' }
    correct { true }
  end

  factory :portuguese_option3_q3, parent: :option do
    # association :question, factory: :portuguese_question_3
    label { 'sujeito' }
  end

  factory :portuguese_option4_q3, parent: :option do
    # association :question, factory: :portuguese_question_3
    label { 'ação' }
  end
end
