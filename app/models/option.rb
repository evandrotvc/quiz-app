class Option < ApplicationRecord
  belongs_to :question

  validates :label, presence: true
end
