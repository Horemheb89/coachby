class Program < ApplicationRecord
  belongs_to :contract
  has_many :meals
  has_many :trainings

def calorie_target
    self.proteins_target * 4 + self.fats_target * 9 + self.carbs_target * 4
end

end

