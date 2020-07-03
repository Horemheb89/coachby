class Meal < ApplicationRecord
  belongs_to :program

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true
  validates :start_time, presence: true
end
