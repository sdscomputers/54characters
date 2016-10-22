require 'rails_helper'

RSpec.describe "client_beds/new", type: :view do
  before(:each) do
    assign(:client_bed, ClientBed.new())
  end

  it "renders new client_bed form" do
    render

    assert_select "form[action=?][method=?]", client_beds_path, "post" do
    end
  end
end
