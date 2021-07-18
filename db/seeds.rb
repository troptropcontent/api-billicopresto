# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
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
end

private 

def random_addresse_generator
	@random_addresse ||= addresse_data_base[Random.new.rand(1..addresse_data_base.count)].to_h
end

def addresse_data_base
	@addresse_data_base ||= CSV.table("db/addresses_51.csv", col_sep: ';')
end