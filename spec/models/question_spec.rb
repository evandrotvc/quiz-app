require 'rails_helper'

RSpec.describe Question do
  describe 'relations' do
    it { is_expected.to have_many(:rounds) }
    it { is_expected.to have_many(:options) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe '#filter_category' do
    let(:category) { create(:portuguese_category) }
    let(:category_math) { create(:mathematic_category) }
    let(:question) do
      create(:portuguese_question_1, rounds: [], category:)
    end
    let(:question2) do
      create(:portuguese_question_2, rounds: [], category:)
    end

    let(:question_math) do
      create(:portuguese_question_2, rounds: [], category: category_math)
    end

    context 'when return only questions from portuguese' do
      it 'has return questions' do
        question
        question2
        question_math

        questions_filtered = described_class.filter_category(category.id).ids

        expect(questions_filtered).to include(question.id, question2.id)
        expect(questions_filtered).not_to include(question_math.id)
      end
    end
  end
end
