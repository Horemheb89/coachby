class Dose < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient


  validates :quantity, presence: true
  validates :meal, uniqueness: { scope: :ingredient }

end
