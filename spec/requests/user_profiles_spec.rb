 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/user_profiles", type: :request do
  
  # UserProfile. As you add validations to UserProfile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserProfile.create! valid_attributes
      get user_profiles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_profile = UserProfile.create! valid_attributes
      get user_profile_url(user_profile)
      expect(response).to be_successful
    end
  end

  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_user_profile_url
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET /edit" do
    it "render a successful response" do
      user_profile = UserProfile.create! valid_attributes
      get edit_user_profile_url(user_profile)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserProfile" do
        expect {
          post user_profiles_url, params: { user_profile: valid_attributes }
        }.to change(UserProfile, :count).by(1)
      end

      it "redirects to the created user_profile" do
        post user_profiles_url, params: { user_profile: valid_attributes }
        expect(response).to redirect_to(user_profile_url(UserProfile.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserProfile" do
        expect {
          post user_profiles_url, params: { user_profile: invalid_attributes }
        }.to change(UserProfile, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post user_profiles_url, params: { user_profile: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_profile" do
        user_profile = UserProfile.create! valid_attributes
        patch user_profile_url(user_profile), params: { user_profile: new_attributes }
        user_profile.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_profile" do
        user_profile = UserProfile.create! valid_attributes
        patch user_profile_url(user_profile), params: { user_profile: new_attributes }
        user_profile.reload
        expect(response).to redirect_to(user_profile_url(user_profile))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user_profile = UserProfile.create! valid_attributes
        patch user_profile_url(user_profile), params: { user_profile: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_profile" do
      user_profile = UserProfile.create! valid_attributes
      expect {
        delete user_profile_url(user_profile)
      }.to change(UserProfile, :count).by(-1)
    end

    it "redirects to the user_profiles list" do
      user_profile = UserProfile.create! valid_attributes
      delete user_profile_url(user_profile)
      expect(response).to redirect_to(user_profiles_url)
    end
  end
end
