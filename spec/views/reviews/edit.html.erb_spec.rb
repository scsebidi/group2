require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :username => "MyString",
      :review => "MyText",
      :product_id => 1
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_username[name=?]", "review[username]"
      assert_select "textarea#review_review[name=?]", "review[review]"
      assert_select "input#review_product_id[name=?]", "review[product_id]"
    end
  end
end
