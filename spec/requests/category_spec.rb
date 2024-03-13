require 'rails_helper'

RSpec.describe Category do
  describe 'GET /categories' do
    let(:json) { response.parsed_body }

    before do
      create_list(:category, 3)
      get '/categories', as: :json
    end

    it 'return status ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'return categories list in response' do
      expect(json['categories'].size).to eq(3)
    end

    it 'return all attributes from category' do
      expect(json['categories']).to all(have_key('id').and(have_key('name')))
    end
  end
end
