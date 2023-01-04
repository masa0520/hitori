require 'rails_helper'

RSpec.describe "stores/show", type: :view do
  before(:each) do
    assign(:store, Store.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
