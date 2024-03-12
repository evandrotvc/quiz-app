require 'rails_helper'

RSpec.describe Category do
  describe 'relations' do
    it { is_expected.to have_many(:rounds) }
  end
end
