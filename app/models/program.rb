class Program < ApplicationRecord
  belongs_to :contract
  has_many :meals
  has_many :sessions

end





