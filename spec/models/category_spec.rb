require 'rails_helper'

RSpec.describe Category do
  describe 'relations' do
    it { is_expected.to have_many(:rounds) }
    it { is_expected.to have_many(:questions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'raises error when trying to create categories with the same name' do
      described_class.create(name: 'Test Category')
      expect do
        described_class.create!(name: 'Test Category')
      end.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
