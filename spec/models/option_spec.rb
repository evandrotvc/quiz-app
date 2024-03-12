require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'relations' do
    it { should belong_to(:question) }
  end

  describe 'validations' do
    it { should validate_presence_of(:label) }
  end

end