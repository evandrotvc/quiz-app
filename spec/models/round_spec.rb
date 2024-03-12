require 'rails_helper'

RSpec.describe Round, type: :model do
  describe 'relations' do
    it { should belong_to(:player) }
    it { should belong_to(:category) }
    it { should have_many(:questions) }
    it { should have_many(:answers) }
  end

end