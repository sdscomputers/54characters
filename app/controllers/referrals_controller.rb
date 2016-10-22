class ReferralsController < ApplicationController
  def index
    @referrals = Referral.all
  end

  def show
    @referral = Referral.find params[:id]
  end

  def new
    @referral = Referral.new
  end

  def edit
    @referral = Referral.find params[:id]
  end

  def create
    @referral = Referral.new referral_params
    if @referral.save
      redirect_to refferals_path, success: 'Save Successful'
    else
      render :new
    end
  end

  def update
    @referral = Refferal.find params[:id]
    if @referral.update_attributes refferal_params
      redirect_to referal_path(@refferal.id), success: 'Save Successful'
    else
      render :edit
    end
  end

  def destroy
    @referral = Referral.find params[:id]
    @referral.destroy
    redirect_to referrals_path, success: 'Delete Successful'
  end

  private

  def referral_params
    params.require(:referral).permit(:reffering_organization_id, :referred_organization_id,
                                     :reffered_by_id, :client_id)
  end
end
