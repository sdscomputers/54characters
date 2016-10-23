class ReferralMailer < ApplicationMailer
  def client_notification(client_id, organization_id)
    @client = Client.find(client_id)
    @organization = Organization.id
  end

  def referring_organization_notification(referred_id, referring_id)
    @referred = Organization.find(referred_id)
    @referring = Organization.find(referring_id)
    mail(to: 'organizationb@gmail.com', subject: '54 Characters - Referral Sent')
  end

  def referred_organization_notification(referred_id, referring_id)
    @referred = Organization.find(referred_id)
    @referring = Organization.find(referring_id)
    mail(to: 'organizationa@gmail.com', subject: '54 Characters - You have been Referred')
  end

  def no_response_notification(referral_id)
    @referral = Referral.find(referral_id)
    mail(to: 'organizationb@gmail.com', subject: '54 Characters - No Response')
  end
end
