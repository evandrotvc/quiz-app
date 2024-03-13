class Question < ApplicationRecord
  belongs_to :category
  has_one :answers, dependent: :nullify
  has_many :options, dependent: :destroy

  has_many :question_rounds, dependent: :destroy
  has_many :rounds, through: :question_rounds, dependent: :destroy

  validates :description, presence: true

  def self.filter_category(category_id)
    Question.where(category_id:)
  end
end
