require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'relations' do
    it { should belong_to(:round) }
    it { should have_many(:options) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

end