  class ConfirmReferralsController < ApplicationController
    def edit
      @referral = Referral.find(params[:id])
    end

    def update
      @referral = Referral.find params[:id]
      if @referral.update_attributes referral_params
        CompleteReferralJob.perform_later(params[:id])
        redirect_to root_path, success: 'Referral Completed'
      else
        render :edit
      end
    end

    private

    def referral_params
      params.require(:referral).permit(:status)
    end
  end
