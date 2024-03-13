class Answer < ApplicationRecord
  belongs_to :round
  belongs_to :question
  belongs_to :option

  delegate :correct, to: :option, allow_nil: true, prefix: true

end
