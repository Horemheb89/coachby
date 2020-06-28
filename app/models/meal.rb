class Meal < ApplicationRecord
  belongs_to :program

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
end
