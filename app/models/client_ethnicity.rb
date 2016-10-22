class ClientEthnicity < ApplicationRecord
  validates :client_id, presence: true
  validates :ethnicity_id, presence: true, uniqueness: { scope: :client_id }

  belongs_to :client
  belongs_to :ethnicity
end
