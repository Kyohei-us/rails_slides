require 'rails_helper'

RSpec.describe "user_profiles/index", type: :view do
  before(:each) do
    assign(:user_profiles, [
      UserProfile.create!(
        lastfmUsername: "Lastfm Username",
        user_id: 2
      ),
      UserProfile.create!(
        lastfmUsername: "Lastfm Username",
        user_id: 2
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    assert_select "tr>td", text: "Lastfm Username".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
