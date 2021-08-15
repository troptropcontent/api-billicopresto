require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET" do
    let!(:user) {User.create!(email: "testtest@example.com", last_name:"Saint Frison", first_name: "Agathe", password: "Test.123", password_confirmation: "Test.123")}
    before {sign_in user}
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
