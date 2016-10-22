require 'rails_helper'

RSpec.describe "client_beds/index", type: :view do
  before(:each) do
    assign(:client_beds, [
      ClientBed.create!(),
      ClientBed.create!()
    ])
  end

  it "renders a list of client_beds" do
    render
  end
end
