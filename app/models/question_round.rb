class QuestionRound < ApplicationRecord
  belongs_to :round
  belongs_to :question
end
