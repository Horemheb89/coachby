class Meal < ApplicationRecord
  belongs_to :program

  has_many :ingredients, through: :doses
end
