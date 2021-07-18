# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

number_of_devise_entity = 20


ap I18n.t 'seed.creation_of_many', number: number_of_devise_entity, model: Retailer.name
number_of_devise_entity.times do
	ap I18n.t 'seed.creation_of_one', model: Retailer.name
	fake_name = Faker::Company.name
	Retailer.create!(name: fake_name, 
		email: "#{fake_name.gsub(/[^0-9a-z]/i, '')}@example.com",
		street: random_addresse_generator[:nom_voie], 
		zip_code: random_addresse_generator[:code_postal],
		number: random_addresse_generator[:numero],
		city: random_addresse_generator[:nom_commune],
		password: "Test.123", 
		password_confirmation: "Test.123"
		)
	ap I18n.t 'seed.users.user_created', number: number_of_devise_entity, model: Retailer.name	
end

number_of_devise_entity.times do
	first_name =  Faker::Name.first_name
	last_name = Faker::Name.last_name
	User.create!(
		email: "#{first_name}.#{last_name}@example.com",
		first_name: first_name,
		last_name: last_name,
		password: "Test.123", 
		password_confirmation: "Test.123"
		)

end

User.each do

end

private 

def random_addresse_generator
	@random_addresse ||= addresse_data_base[Random.new.rand(1..addresse_data_base.count)].to_h
end

def grocery_store_database
	@grocery_store_database ||= 
end