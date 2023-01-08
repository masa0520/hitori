require 'rails_helper'

RSpec.describe "stores/new", type: :view do
  before(:each) do
    assign(:store, Store.new())
  end

  it "renders new store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do
    end
  end
end
