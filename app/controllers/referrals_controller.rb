class ReferralsController < ApplicationController
  def index
    @referrals = Referral.all
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new referral_params
    if @referral.save
      redirect_to referrals_path, success: 'Save Successful'
    else
      render :new
    end
  end

  private

  def referral_params
    params.require(:referral).permit(:referring_organization_id, :referred_organization_id,
                                     :reffered_by_id, :client_id)
  end
end
