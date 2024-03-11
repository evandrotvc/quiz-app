class Round < ApplicationRecord
  belongs_to :player
  belongs_to :category

  has_many :questions
end
