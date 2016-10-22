class Referral < ApplicationRecord
  validates :referred_organization_id, presence: true
  validates :referring_organization_id, presence: true
  validates :client_id, presence: true
  validates :refered_by_id, presence: true

  belongs_to :referred_organization, class_name: Organization, foreign_key: :referred_organization_id
  belongs_to :reffering_organization, class_name: Organization, foreign_key: :referring_organization_id
  belongs_to :client
  belongs_to :user, foreign_key: :refered_by_id
end
