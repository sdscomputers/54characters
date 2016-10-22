class Client < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :ss_number, presence: true

  has_many :client_military_conflicts
  has_many :military_conflicts, through: :military_conflict_id
  has_many :client_ethnicities
  has_many :ethnicities, through: :client_ethnicities
end
