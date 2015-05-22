require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :username => "Username",
      :review => "MyText",
      :product_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
