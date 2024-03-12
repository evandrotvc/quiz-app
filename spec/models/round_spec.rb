require 'rails_helper'

RSpec.describe Round do
  describe 'relations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:questions) }
    it { is_expected.to have_many(:answers) }
  end
end
