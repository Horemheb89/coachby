class Session < ApplicationRecord
  belongs_to :program
  has_many :exercises
end
