require "./app/lib/open_data_paris/open_data_paris_client"

grocery_store_database ||= OpenDataParisClient.fetch_grocery_store(50)
number_of_devise_entity = 20

ap I18n.t 'seed.reseting_model_database', model: Retailer.name
Retailer.delete_all
ap I18n.t 'seed.creation_of_many', number: number_of_devise_entity, model: Retailer.name
grocery_store_database.each do |grocery_store|
	data = grocery_store["fields"]
	next unless data["mail"]
	ap I18n.t 'seed.creation_of_one', model: Retailer.name
	retailer = Retailer.create!(name: data["nom_du_commerce"], 
		email: data["mail"],
		full_address: data["adresse"], 
		zip_code: data["code_postal"],
		city: "Paris",
		password: "Test.123", 
		password_confirmation: "Test.123"
		)
	ap I18n.t 'seed.retailers.retailer_created', name: retailer.name, full_address: retailer.full_address, zip_code: retailer.zip_code, city: retailer.city, email: retailer.email
	break if Retailer.count == number_of_devise_entity
end

ap I18n.t 'seed.reseting_model_database', model: User.name
User.delete_all
ap I18n.t 'seed.creation_of_many', number: number_of_devise_entity, model: User.name

number_of_entity_created = 0
while number_of_entity_created <= number_of_devise_entity do
	first_name =  Faker::Name.first_name
	last_name = Faker::Name.last_name
	user = User.create(
		email: I18n.transliterate("#{first_name}.#{last_name}@example.com"),
		first_name: first_name,
		last_name: last_name,
		password: "Test.123", 
		password_confirmation: "Test.123"
		)
	next unless user.valid?
	ap I18n.t 'seed.users.user_created', first_name: user.first_name, last_name: user.last_name, email: user.email 
	number_of_entity_created += 1
end

