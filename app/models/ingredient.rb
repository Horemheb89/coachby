class Ingredient < ApplicationRecord
  has_many :doses
  has_many :meals, through: :doses

  validates :quantity, presence: true
  validates :proteins, presence: true
  validates :fats, presence: true
  validates :carbs, presence: true

end
