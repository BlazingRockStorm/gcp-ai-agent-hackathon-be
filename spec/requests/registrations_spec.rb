# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /create" do
   it "creates a new user with valid parameters" do
      valid_attributes = { user: { email_address: "test@example.com", password: "password123" } }

      expect {
        post registrations_path, params: valid_attributes
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
    end

    it "does not create a new user with invalid parameters" do
      invalid_attributes = { user: { email_address: "", password: "" } }

      expect {
        post registrations_path, params: invalid_attributes
      }.to change(User, :count).by(0)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
