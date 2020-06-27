class Contract < ApplicationRecord
  belongs_to :coach, class_name: "User"
  belongs_to :athlete, class_name: "User"

  has_many :programs
end
