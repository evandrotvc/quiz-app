require 'rails_helper'

RSpec.describe Question do
  describe 'relations' do
    it { is_expected.to have_many(:rounds) }
    it { is_expected.to have_many(:options) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
  end
end
