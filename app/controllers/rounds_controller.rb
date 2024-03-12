class RoundsController < ApplicationController
  before_action :set_round, only: %i[result show answers]

  def show
    @round = Round.find(params[:id])

    render :show
  end

  def create
    player = Player.find_by(name: round_params[:player_name])
    questions = Question.filter_category(round_params[:category_id]).sample(3)

    @round = Round.new(round_params.except(:player_name).merge(player: player, questions: questions, total_questions: questions.count))

    if @round.save
      render :create, status: :created
    else
      render :errors , status: :unprocessable_entity
    end
  end

  def result
    render :result
  end

  def answers
    option = Option.find(answer_params[:option_id])
    @answer = @round.answers.build(answer_params.merge(correct: option.correct))

    if @answer.save
      render 'rounds/answers', status: :created
    else
      render json: { errors: @answer.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:player_name, :category_id)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id)
  end
end
