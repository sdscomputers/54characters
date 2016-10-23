class HousingController < ApplicationController

  def index
    @organizations = Organization.all
  end
end
