class Ethnicity < ApplicationRecord
  validates :description, presence: true

  has_many :client_ethnicities
  has_many :clients, through: :client_ethnicities
end
