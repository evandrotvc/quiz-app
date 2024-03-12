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

    it 'retorna a lista de categorias em JSON' do
      expect(json['categories'].size).to eq(3)
    end

    it 'retorna os atributos corretos para cada categoria' do
      json['categories'].each do |category|
        expect(category).to have_key('id')
        expect(category).to have_key('name')
      end
    end
  end
end
