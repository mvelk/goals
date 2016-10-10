require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates presence of username and password" do
        post :create, user: {username: Faker::Name.name, password: ""}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it "validates the length of password is at least 6" do
        post :create, user: {username: Faker::Name.name, password: "short"}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to goals index on success" do
        post :create, user: {username: Faker::Name.name, password: Faker::Internet.password(8)}
        expect(response).to redirect_to(goals_url)
      end
    end
  end
end
