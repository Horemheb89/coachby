class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true
  has_many :contracts_as_coach, foreign_key: :coach_id, class_name: "Contract"
  has_many :athletes, through: :contracts_as_coach
  has_one :contract_as_athlete, foreign_key: :athlete_id, class_name: "Contract"
  has_one :coach, through: :contract_as_athlete

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
