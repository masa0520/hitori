require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      nickname: "Nickname",
      age: 2,
      text: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
