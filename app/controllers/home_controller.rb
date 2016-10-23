class HomeController < ApplicationController
  def index
    organizations = Organization.where("organizations.max_beds - organizations.client_bed_count > 0").sort { |x,y| x.open_beds <=> y.open_beds }
    @organizations = organizations.first(6)
  end
end
