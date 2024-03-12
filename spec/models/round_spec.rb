require 'rails_helper'

RSpec.describe Round do
  describe 'relations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:questions) }
    it { is_expected.to have_many(:answers) }
  end

  describe 'persist' do
    let(:round) { create(:rounds_1) }
    let(:question1) { create(:portuguese_question_1) }
    let(:history_category) { create(:history_category) }
    let(:option) { create(:portuguese_option1_q1) }

    it 'test' do
      byebug
    end
  end
end
