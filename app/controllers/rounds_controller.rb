class RoundsController < ApplicationController
  before_action :set_round, only: %i[result show answers]

  def show
    @round = Round.find(params[:id])

    render :show
  end

  def create
    player = Player.find_or_create_by(name: round_params[:player_name])

    questions = Question.filter_category(round_params[:category_id]).sample(2)

    @round = Round.new(round_params.except(:player_name).merge(player:,
      questions:))

    if @round.save
      render :create, status: :created
    else
      render :errors, status: :unprocessable_entity
    end
  end

  def result
    render :result
  end

  def answers
    @answer = @round.answers.build(answer_params)

    if @answer.save
      render 'rounds/answers', status: :created
    else
      render 'answers/errors', status: :unprocessable_entity
    end
  end

  private

  def set_round
    @round = Round.includes(:questions, questions: :options).find(params[:id])
  end

  def round_params
    params.require(:round).permit(:player_name, :category_id)
  end

  def answer_params
    params.require(:answer).permit(:question_id, :option_id)
  end
end
