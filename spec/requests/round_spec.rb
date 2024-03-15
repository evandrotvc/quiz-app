# spec/requests/rounds_spec.rb
require 'rails_helper'

RSpec.describe 'Rounds' do
  let(:json) { response.parsed_body }

  describe 'GET /rounds/:id' do
    context 'when questions all correct' do
      let(:category) { create(:portuguese_category) }
      let(:round) { create(:rounds_1, category:) }
      let(:question) do
        create(:portuguese_question_1, rounds: [round], category:)
      end
      let(:option) { question.options.find_by(correct: true) } # get option correct
      let(:answer) do
        create(:answer, round:, question:, option:)
      end

      it 'returns a round with questions and answers' do
        answer
        get "/rounds/#{round.id}", as: :json
        expect(response).to have_http_status(:success)

        expect(json['round']['player_id']).to eq(round.player_id)
        expect(json['round']['questions'].count).to eq(1)
        expect(json['round']['questions'].first['options'].count).to eq(4)
        expect(json['round']['answers'].count).to eq(1)
        expect(json['round']['answers'].first['correct']).to be(true)
      end
    end
  end

  describe 'POST /rounds' do
    let(:player) { create(:player) }
    let(:category) { create(:portuguese_category) }
    let(:question1) do
      create(:portuguese_question_1, rounds: [], category:)
    end

    let(:question2) do
      create(:portuguese_question_2, rounds: [], category:)
    end

    let(:question3) do
      create(:portuguese_question_3, rounds: [], category:)
    end

    context 'when parameters are valid' do
      it 'creates a new round' do
        question1
        question2
        question3
        round_params = { round: { player_name: player.name, category_id: category.id } }

        post '/rounds', params: round_params, as: :json
        expect(response).to have_http_status(:created)

        expect(json['round']['player_id']).to eq(player.id)
        expect(json['round']['questions'].count).to eq(2)
        expect(json['round']['questions'].first['options'].count).to eq(4)
        expect(json['round']['answers'].count).to eq(0)
      end
    end

    context 'when parameters are invalid' do
      it 'returns unprocessable_entity' do
        post '/rounds', params: { round: { player_name: nil, category_id: nil } },
          as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /rounds/:id/result' do
    context 'when user answered all questions correct' do
      let(:category) { create(:portuguese_category) }
      let(:round) { create(:rounds_1, category:) }
      let(:question) do
        create(:portuguese_question_1, rounds: [round], category:)
      end
      let(:question2) do
        create(:portuguese_question_2, rounds: [round], category:)
      end
      let(:option_q1) { question.options.find_by(correct: true) } # get option correct
      let(:option_q2) { question2.options.find_by(correct: true) } # get option correct
      let(:answer) do
        create(:answer, round:, question:, option: option_q1)
      end
      let(:answer2) do
        create(:answer, round:, question:, option: option_q2)
      end

      it 'returns the result of a round' do
        answer
        answer2
        get "/rounds/#{round.id}/result", as: :json
        expect(response).to have_http_status(:success)

        expect(json['round']).to include('id', 'player_id', 'total_questions',
          'total_answered_questions', 'total_correct_answers')
        expect(json['round']['total_questions']).to eq(2)
        expect(json['round']['total_correct_answers']).to eq(2)
        expect(json['round']['total_answered_questions']).to eq(2)
      end
    end

    context 'when user answered one question correct' do
      let(:category) { create(:portuguese_category) }
      let(:round) { create(:rounds_1, category:) }
      let(:question) do
        create(:portuguese_question_1, rounds: [round], category:)
      end
      let(:question2) do
        create(:portuguese_question_2, rounds: [round], category:)
      end
      let(:option_q1) { question.options.find_by(correct: true) } # get option correct
      let(:option_q2) { question2.options.find_by(correct: false) } # get option correct
      let(:answer) do
        create(:answer, round:, question:, option: option_q1)
      end
      let(:answer2) do
        create(:answer, round:, question:, option: option_q2)
      end

      it 'returns the result of a round' do
        answer
        answer2
        get "/rounds/#{round.id}/result", as: :json
        expect(response).to have_http_status(:success)

        expect(json['round']).to include('id', 'player_id', 'total_questions',
          'total_answered_questions', 'total_correct_answers')
        expect(json['round']['total_questions']).to eq(2)
        expect(json['round']['total_correct_answers']).to eq(1)
        expect(json['round']['total_answered_questions']).to eq(2)
      end
    end
  end

  describe 'POST /rounds/:id/answers' do
    let(:category) { create(:portuguese_category) }
    let(:round) { create(:rounds_1, category:) }
    let(:question) do
      create(:portuguese_question_1, rounds: [round], category:)
    end

    context 'when answer is correct' do
      let(:option) { question.options.find_by(correct: true) } # get option correct

      it 'creates a new answer for a round' do
        answer_params = { answer: { question_id: question.id, option_id: option.id } }

        post "/rounds/#{round.id}/answers", params: answer_params, as: :json
        expect(response).to have_http_status(:created)

        expect(json['answer']['question_id']).to eq(question.id)
        expect(json['answer']['option_id']).to eq(option.id)
        expect(json['answer']['correct']).to be(true)
      end
    end

    context 'when answer is false' do
      let(:option) { question.options.find_by(correct: false) } # get option false

      it 'creates a new answer for a round' do
        answer_params = { answer: { question_id: question.id, option_id: option.id } }

        post "/rounds/#{round.id}/answers", params: answer_params, as: :json
        expect(response).to have_http_status(:created)

        expect(json['answer']['question_id']).to eq(question.id)
        expect(json['answer']['option_id']).to eq(option.id)
        expect(json['answer']['correct']).to be(false)
      end
    end

    context 'when parameters are invalid' do
      it 'returns unprocessable_entity' do
        post "/rounds/#{round.id}/answers",
          params: { answer: { question_id: nil, option_id: nil } }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
