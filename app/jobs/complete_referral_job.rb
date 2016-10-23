class CompleteReferralJob < ApplicationJob
  def perform(referral_id)
    referral = Referral.find params[:id]
    ReferralMailer.referal_complete_notification(referral_id).deliver_now
  end
end
