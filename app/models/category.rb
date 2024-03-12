class Category < ApplicationRecord
  has_many :rounds
  has_many :questions
end
