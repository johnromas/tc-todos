require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do

  context "POST #create" do
    it "creates a new user" do
      post :create, {
        user: {
          first_name: "John",
          last_name: "Romas",
          email: "john@example.com"
        }
      }
      expect(@response.status).to eq(201)
    end
  end
end
