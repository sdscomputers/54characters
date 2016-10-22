class MilitaryConflict < ApplicationRecord
  validates :description, presence: true

  has_many :client_military_conflicts
  has_many :clients, through: :client_military_conflicts
end
