require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      nickname: "MyString",
      age: 1,
      text: "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[nickname]"

      assert_select "input[name=?]", "user[age]"

      assert_select "textarea[name=?]", "user[text]"
    end
  end
end