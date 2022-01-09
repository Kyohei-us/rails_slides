require 'rails_helper'

RSpec.describe "user_profiles/new", type: :view do
  before(:each) do
    assign(:user_profile, UserProfile.new(
      lastfmUsername: "MyString",
      user_id: 1
    ))
  end

  it "renders new user_profile form" do
    render

    assert_select "form[action=?][method=?]", user_profiles_path, "post" do

      assert_select "input[name=?]", "user_profile[lastfmUsername]"

      assert_select "input[name=?]", "user_profile[user_id]"
    end
  end
end
