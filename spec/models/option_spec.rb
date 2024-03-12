require 'rails_helper'

RSpec.describe Option do
  describe 'relations' do
    it { is_expected.to belong_to(:question) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }
  end
end
