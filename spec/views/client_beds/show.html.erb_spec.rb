require 'rails_helper'

RSpec.describe "client_beds/show", type: :view do
  before(:each) do
    @client_bed = assign(:client_bed, ClientBed.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
