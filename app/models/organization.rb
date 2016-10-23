class Organization < ApplicationRecord

  def open_beds
    max_beds - client_bed_count
  end
end
