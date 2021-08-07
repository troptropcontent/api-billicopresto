require 'rails_helper'

RSpec.describe "Receipts", type: :request do
  let!(:user) {User.create!(email: "testtest@example.com", last_name:"Saint Frison", first_name: "Agathe", password: "Test.123", password_confirmation: "Test.123")}
  let(:retailer) {Retailer.create!(name: "Test Market", 
    email: "testmarket@example.com",
    full_address: "36 rue du test", 
    zip_code: "75018",
    city: "Paris",
    password: "Test.123", 
    password_confirmation: "Test.123"
    )}
  let(:till) {Till.create!(retailer: retailer, reference: 1)}
  let(:receipt) {Receipt.create!(till: till, reference: "TEST0001", user: user)}
  let(:carrot) {Product.create!(name: "carrot", kind: "Food and beverages")}
  let(:item_carrot) {Item.create!(product: carrot, retailer: retailer)}
  let!(:receipt_line) {ReceiptLine.create!(receipt: receipt, quantity: 2, unit_price_cent: 99, taxe_rate: 20, item: item_carrot)}
  before {sign_in user}
  describe "GET /index" do
    it "returns http success" do
      get "/receipts/index" 
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /:id" do
    it "returns http success" do
      get "/receipts/#{receipt.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
