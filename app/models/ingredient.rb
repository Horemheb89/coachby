class Ingredient < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :meals, through: :doses

  validates :proteins, :fats, :carbs, presence: true

end
