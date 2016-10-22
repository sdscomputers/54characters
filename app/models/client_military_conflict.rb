class ClientMilitaryConflict < ApplicationRecord
  validates :client_id, presence: true
  validates :military_conflict_id, presence: true, uniqueness: { scope: :client_id }

  belongs_to :client
  belongs_to :military_conflict
end
