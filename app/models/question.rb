class Question < ApplicationRecord
  belongs_to :round
  belongs_to :category
  has_many :options

  validates :description, presence: true
end
