require 'rails_helper'

RSpec.describe Player do
  describe 'relations' do
    it { is_expected.to have_many(:rounds) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
