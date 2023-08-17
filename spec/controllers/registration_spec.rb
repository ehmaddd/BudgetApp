require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST #create" do
    context "with valid user params" do
      it "redirects to authenticated_root_path after successful sign-up" do
        user_params = {
          user: {
            name: "John Doe",
            email: "john@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }

        post :create, params: user_params

        expect(response).to redirect_to(authenticated_root_path)
      end

      it "creates a new user" do
        expect {
          post :create, params: {
            user: {
              name: "Jane Smith",
              email: "jane@example.com",
              password: "password",
              password_confirmation: "password"
            }
          }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid user params" do
      it "renders the sign-up page again" do
        invalid_user_params = {
          user: {
            name: "Invalid User",
            email: "", # Invalid email
            password: "password",
            password_confirmation: "password"
          }
        }

        post :create, params: invalid_user_params

        expect(response).to render_template(:new)
      end

      it "does not create a new user" do
        expect {
          post :create, params: {
            user: {
              name: "Jane Smith",
              email: "", # Invalid email
              password: "password",
              password_confirmation: "password"
            }
          }
        }.not_to change(User, :count)
      end
    end
  end
end
