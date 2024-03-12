require 'rails_helper'

RSpec.describe Answer do
  describe 'relations' do
    it { is_expected.to belong_to(:round) }
    it { is_expected.to belong_to(:question) }
    it { is_expected.to belong_to(:option) }
  end
end
