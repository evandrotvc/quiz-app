class Question < ApplicationRecord
  belongs_to :round
  has_many :options

  validates :description, presence: true
end
