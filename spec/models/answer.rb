require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'relations' do
    it { should belong_to(:round) }
    it { should belong_to(:question) }
    it { should belong_to(:option) }
  end
end