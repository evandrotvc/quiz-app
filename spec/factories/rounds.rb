FactoryBot.define do
  factory :round do
  end
  factory :rounds_1, parent: :round do
    association :player

    # after(:create) do |round|
    #     round.questions << create(:portuguese_question_1)
    # end

    association :category, factory: :portuguese_category
  end   
end
