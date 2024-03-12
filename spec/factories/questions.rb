FactoryBot.define do
  factory :question do
  end
  factory :portuguese_question_1, parent: :question do
    association :round, factory: :rounds_1
    association :category, factory: :portuguese_category

    after(:build) do |question|
        question.options << create(:portuguese_option1_q1, question: question)
        question.options << create(:portuguese_option2_q1, question: question)
        question.options << create(:portuguese_option3_q1, question: question)
        question.options << create(:portuguese_option4_q1, question: question)
    end

    description { 'o que é crase?' }
  end
end
