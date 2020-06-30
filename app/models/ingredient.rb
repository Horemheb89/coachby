class Ingredient < ApplicationRecord
  has_many :doses
  has_many :meals, through: :doses
end
