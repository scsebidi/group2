require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user_id => 1,
      :email => "Email",
      :name => "Name",
      :address => "MyText",
      :pay_type => "Pay Type",
      :order_status => "Order Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Email/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Pay Type/)
    rendered.should match(/Order Status/)
  end
end
