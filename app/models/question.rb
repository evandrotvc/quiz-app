class Question < ApplicationRecord
  belongs_to :round
  belongs_to :category
  has_one :answers
  has_many :options

  validates :description, presence: true

  # scope :filter_category (category_id) -> { where(category_id: category_id) }

  def self.filter_category(category_id)
    Question.where(category_id: category_id)
  end
end
