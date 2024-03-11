class Question < ApplicationRecord
  has_many :round
  has_many :options
end
