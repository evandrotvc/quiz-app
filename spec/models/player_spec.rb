require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relations' do
    it { should have_many(:rounds) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end