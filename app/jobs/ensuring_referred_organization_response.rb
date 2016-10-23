class EnsureReferredOrganizationResponse < ApplicationJob
  def perform(referral_id)
    referral = Referral.find(params[:id])
    return unless referral.status == 'P'
    referral.update_attributes(:status, 'N')
    ReferralMailer.no_response_notification(refferal_id).deliver_now
  end
end
