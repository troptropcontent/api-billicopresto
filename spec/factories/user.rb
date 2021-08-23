FactoryBot.define do
  factory :user do
    first_name { "John" }
    sequence :last_name do |n|
      "Doe #{n}"
    end
    password { "randompassword" }
    password_confirmation { "randompassword" }
    sequence :email do |n|
      "#{first_name}#{last_name.gsub(" ","")}@example.com"
    end
  end
end