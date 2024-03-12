# spec/requests/rounds_spec.rb
require 'rails_helper'

RSpec.describe 'Rounds' do
  describe 'GET /rounds/:id' do
    let(:round) { create(:rounds_1) }
    let(:answer) { create(:answer_question_1) }

    it 'returns a round with questions and answers' do
      byebug
      get "/rounds/#{round.id}"
      expect(response).to have_http_status(:success)

      json_response = response.parsed_body
      expect(json_response).to have_key('round')
      expect(json_response['round']).to include('id', 'player_id', 'questions', 'answers')
    end
  end

  # describe 'POST /rounds' do
  #   it 'creates a new round' do
  #     player = create(:player)
  #     category = create(:category)
  #     round_params = { round: { player_name: player.name, category_id: category.id } }

  #     post '/rounds', params: round_params
  #     expect(response).to have_http_status(:created)

  #     json_response = response.parsed_body
  #     expect(json_response).to have_key('round')
  #     expect(json_response['round']).to include('id', 'player_id', 'questions', 'answers')
  #   end
  # end

  # describe 'GET /rounds/:id/result' do
  #   it 'returns the result of a round' do
  #     round = create(:round_with_questions_and_answers)
  #     get "/rounds/#{round.id}/result"
  #     expect(response).to have_http_status(:success)

  #     json_response = response.parsed_body
  #     expect(json_response).to have_key('round')
  #     expect(json_response['round']).to include('id', 'player_id', 'total_questions',
  #       'total_answered_questions', 'total_correct_answers')
  #   end
  # end

  # describe 'POST /rounds/:id/answers' do
  #   it 'creates a new answer for a round' do
  #     round = create(:round_with_questions)
  #     question = round.questions.first
  #     option = question.options.first
  #     answer_params = { answer: { question_id: question.id, option_id: option.id } }

  #     post "/rounds/#{round.id}/answers", params: answer_params
  #     expect(response).to have_http_status(:created)

  #     json_response = response.parsed_body
  #     expect(json_response).to have_key('answer')
  #     expect(json_response['answer']).to include('id', 'question_id', 'option_id',
  #       'correct')
  #   end
  # end
end
