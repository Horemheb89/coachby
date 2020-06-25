class Contract < ApplicationRecord
  belongs_to :user
  has_many :programs
end
