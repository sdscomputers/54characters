class NotifyReferredOrganizationJob < ApplicationJob
  def perform(refferal_id)
    referral = Refferal.find(refferal_id)
    referring = Organization.find(referral.referring_organization_id)
    referred = Organization.find(referral.referred_organization_id)
    ReferralMailer.reffering_organization_notification(referred.id, referring.id).deliver_later
    ReferralMailer.reffered_organization_notification(referred.id, referring.id).deliver_later
    EnsureReferredOrganizationResponse.set(wait: 1.hour).peform_later(refferal_id)
  end
end
