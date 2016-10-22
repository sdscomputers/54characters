class ReferralMailer < ApplicationMailer
  def client_notification(client_id, organization_id)
    @client = Client.find(client_id)
    @organization = Organization.id
  end

  def referring_organization_notification(referred_id, referring_id)
    @referred = Organization.find(referred_id)
    @referring = Organization.find(referring_id)
  end

  def referred_organization_notification(referred_id, referring_id)
    @referred = Organization.find(referred_id)
    @referring = Organization.find(referring_id)
  end
end
