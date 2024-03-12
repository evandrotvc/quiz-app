class Answer < ApplicationRecord
  belongs_to :round
  belongs_to :question
  belongs_to :option
end
