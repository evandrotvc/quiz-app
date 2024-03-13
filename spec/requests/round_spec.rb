# spec/requests/rounds_spec.rb
require 'rails_helper'

RSpec.describe 'Rounds' do
  let(:json) { response.parsed_body }

  describe 'GET /rounds/:id' do
    context 'questions all correct' do
      let(:round) { create(:rounds_1) }
      let(:question) { round.questions.first }
      let(:option) { create(:portuguese_option4_q1, question: question) }  # setted correct true
      let(:answer) { create(:answer, round: round, question: question, option: option, correct: true) }

      it 'returns a round with questions and answers' do
        answer
        get "/rounds/#{round.id}", as: :json
        expect(response).to have_http_status(:success)

        expect(json['round']).to include('id', 'player_id', 'questions', 'answers')
        expect(json['round']['player_id']).to eq(round.player_id)
        expect(json['round']['questions'].count).to eq(1)
        expect(json['round']['questions'].first['options'].count).to eq(5)
        expect(json['round']['answers'].first['correct']).to eq(true)
      end
    end
  end

  describe 'POST /rounds' do
    it 'creates a new round' do
      player = create(:player)
      category = create(:portuguese_category)
      question1 = create(:portuguese_question_1, category: category)
      question2 = create(:portuguese_question_2, category: category)
      question3 = create(:portuguese_question_3, category: category)

      round_params = { round: { player_name: player.name, category_id: category.id } }

      post '/rounds', params: round_params, as: :json
      expect(response).to have_http_status(:created)

      expect(json['round']['player_id']).to eq(player.id)
      expect(json['round']['questions'].count).to eq(2)
      expect(json['round']['questions'].first['options'].count).to eq(4)
      expect(json['round']['answers'].count).to eq(0)
    end
  end

  describe 'GET /rounds/:id/result' do
    it 'returns the result of a round' do
      round = create(:rounds_1)
      question = round.questions.first
      option = create(:portuguese_option4_q1, question: question)

      answer = create(:answer, round: round, question: question, option: option, correct: true)
      get "/rounds/#{round.id}/result", as: :json
      expect(response).to have_http_status(:success)

      expect(json).to have_key('round')
      expect(json['round']).to include('id', 'player_id', 'total_questions',
        'total_answered_questions', 'total_correct_answers')
      expect(json['round']['total_questions']).to eq(1)
      expect(json['round']['total_correct_answers']).to eq(1)
      expect(json['round']['total_answered_questions']).to eq(1)
    end
  end

  describe 'POST /rounds/:id/answers' do
    context 'answer is correct' do
      it 'creates a new answer for a round' do
        round = create(:rounds_1)
        question = round.questions.first
        option = create(:portuguese_option4_q1, question: question) # setted correct true

        answer_params = { answer: { question_id: question.id, option_id: option.id } }

        post "/rounds/#{round.id}/answers", params: answer_params, as: :json
        expect(response).to have_http_status(:created)


        expect(json['answer']['question_id']).to eq(question.id)
        expect(json['answer']['option_id']).to eq(option.id)
        expect(json['answer']['correct']).to eq(true)

      end
    end

    context 'answer is false' do
      it 'creates a new answer for a round' do
        round = create(:rounds_1)
        question = round.questions.first
        option = create(:portuguese_option2_q1, question: question) # setted corect false

        answer_params = { answer: { question_id: question.id, option_id: option.id } }

        post "/rounds/#{round.id}/answers", params: answer_params, as: :json
        expect(response).to have_http_status(:created)

        expect(json['answer']['correct']).to eq(false)
        expect(json['answer']['question_id']).to eq(question.id)
        expect(json['answer']['option_id']).to eq(option.id)
      end
    end
  end
end
