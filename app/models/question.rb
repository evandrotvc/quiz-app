class Question < ApplicationRecord
  belongs_to :category
  has_one :answers
  has_many :options

  has_many :question_rounds
  has_many :rounds, through: :question_rounds, dependent: :destroy

  validates :description, presence: true

  def self.filter_category(category_id)
    Question.where(category_id: category_id)
  end
end
