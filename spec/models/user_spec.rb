require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {User.create!(email: "testtest@example.com", last_name:"Saint Frison", first_name: "Agathe", password: "Test.123", password_confirmation: "Test.123", birthday: 33.year.ago)}
  context ".age" do
    it "returns the age of the user" do
      expect(user.age).to eq(33)
    end
  end
end
