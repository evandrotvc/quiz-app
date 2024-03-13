class Round < ApplicationRecord
  belongs_to :player
  belongs_to :category

  has_many :question_rounds, dependent: :destroy
  has_many :questions, through: :question_rounds, dependent: :destroy
  has_many :answers, dependent: :destroy
end
