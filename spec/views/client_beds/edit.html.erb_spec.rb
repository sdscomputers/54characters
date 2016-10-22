require 'rails_helper'

RSpec.describe "client_beds/edit", type: :view do
  before(:each) do
    @client_bed = assign(:client_bed, ClientBed.create!())
  end

  it "renders the edit client_bed form" do
    render

    assert_select "form[action=?][method=?]", client_bed_path(@client_bed), "post" do
    end
  end
end
