# spec/requests/rounds_spec.rb
require 'rails_helper'

RSpec.describe 'Rounds' do
  let(:json) { response.parsed_body }

  describe 'GET /rounds/:id' do
    let(:round) { create(:rounds_1) }
    let(:answer) { create(:answer_question_1) }

    it 'returns a round with questions and answers' do
      get "/rounds/#{round.id}", as: :json
      expect(response).to have_http_status(:success)

      expect(json['round']).to include('id', 'player_id', 'questions', 'answers')
    end
  end

  describe 'POST /rounds' do
    it 'creates a new round' do
      player = create(:player)
      category = create(:portuguese_category)
      # question = create(:portuguese_question_2)
      # question2 = create(:portuguese_question_3)
      round_params = { round: { player_name: player.name, category_id: category.id } }

      post '/rounds', params: round_params, as: :json
      expect(response).to have_http_status(:created)

      # expect(json)
      expect(json).to have_key('round')
      expect(json['round']['player_id']).to eq(player.id)
      expect(json['round']).to include('id', 'player_id', 'questions', 'answers')
    end
  end

  describe 'GET /rounds/:id/result' do
    it 'returns the result of a round' do
      round = create(:rounds_1, total_questions: 3, total_correct_answers: 2, total_answered_questions: 3)
      get "/rounds/#{round.id}/result", as: :json
      expect(response).to have_http_status(:success)

      expect(json).to have_key('round')
      expect(json['round']).to include('id', 'player_id', 'total_questions',
        'total_answered_questions', 'total_correct_answers')
      expect(json['round']['total_questions']).to eq(3)
      expect(json['round']['total_correct_answers']).to eq(2)
      expect(json['round']['total_answered_questions']).to eq(3)
    end
  end

  describe 'POST /rounds/:id/answers' do
    it 'creates a new answer for a round' do
      round = create(:rounds_1)
      question = round.questions.first
      option = question.options.first
      answer_params = { answer: { question_id: question.id, option_id: option.id } }

      post "/rounds/#{round.id}/answers", params: answer_params, as: :json
      expect(response).to have_http_status(:created)

      expect(json).to have_key('answer')
      expect(json['answer']).to include('id', 'question_id', 'option_id',
        'correct')
    end
  end
end
