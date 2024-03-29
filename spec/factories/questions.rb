FactoryBot.define do
  factory :question do
    {}
  end

  factory :portuguese_question_1, parent: :question do
    after(:build) do |question|
      question.options << create(:portuguese_option1_q1, question:)
      question.options << create(:portuguese_option2_q1, question:)
      question.options << create(:portuguese_option3_q1, question:)
      question.options << create(:portuguese_option4_q1, question:)
    end

    description { 'o que é crase?' }
  end

  factory :portuguese_question_2, parent: :question do
    after(:build) do |question|
      question.options << create(:portuguese_option1_q2, question:)
      question.options << create(:portuguese_option2_q2, question:)
      question.options << create(:portuguese_option3_q2, question:)
      question.options << create(:portuguese_option4_q2, question:)
    end

    description { 'o que é verbo?' }
  end

  factory :portuguese_question_3, parent: :question do
    after(:build) do |question|
      question.options << create(:portuguese_option1_q3, question:)
      question.options << create(:portuguese_option2_q3, question:)
      question.options << create(:portuguese_option3_q3, question:)
      question.options << create(:portuguese_option4_q3, question:)
    end

    description { 'o que é adjetivo?' }
  end
end
