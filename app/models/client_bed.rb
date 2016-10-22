class ClientBed < ApplicationRecord
  validates :client_id, presence: true
  validates :organization_id, presence: true, uniqueness: { scope: :client_id }

  belongs_to :client
  belongs_to :organization, counter_cache: :client_bed_count
end
