class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])

    render :show
  end

  def create
    @round = Round.create(round_params)
    render :create status: :created
  end

  def result
    round = Round.find(params[:id])
    render json: { round: { id: round.id, player_id: round.player_id,
                            total_questions: round.total_questions, total_answered_questions: round.total_answered_questions, total_correct_answers: round.total_correct_answers } }
  end

  def answers
    round = Round.find(params[:id])
    @answer = round.answers.build(answer_params)

    if answer.save
      render :answers, status: :created
    else
      render json: { errors: answer.errors }, status: :unprocessable_entity
    end
  end

  private

  def round_params
    params.require(:round).permit(:player_name, :category_id)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id)
  end
end