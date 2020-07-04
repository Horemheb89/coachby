class Meal < ApplicationRecord
  belongs_to :program

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true
  validates :start_time, presence: true

  def proteins
    self.doses.map { |dose| dose.quantity * dose.ingredient.proteins }.sum()/100
  end

  def fats
    self.doses.map { |dose| dose.quantity * dose.ingredient.fats }.sum()/100
  end

  def carbs
    self.doses.map { |dose| dose.quantity * dose.ingredient.carbs }.sum()/100
  end
end
