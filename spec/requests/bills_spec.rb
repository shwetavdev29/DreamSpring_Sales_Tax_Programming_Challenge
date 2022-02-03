require 'rails_helper'

RSpec.describe "Bills", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/bills/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bills/create"
      expect(response).to have_http_status(:success)
    end
  end

end
