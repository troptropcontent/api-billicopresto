require "./app/lib/open_data_paris/open_data_paris_client"
require "./app/models/receipt"

def next_receipt_reference(retailer)
	retailer_acronym = I18n.transliterate(retailer.name).upcase.gsub(" ","")[0..3]
	last_id = retailer.receipts.last&.id || 0
	next_available_id = last_id + 1
	number_of_zeros = 5 - next_available_id.to_s.length
	"#{retailer_acronym}#{"0"*number_of_zeros}#{next_available_id}"
end

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

ap I18n.t 'seed.reseting_model_database', model: Product.name
Product.delete_all
ap I18n.t 'seed.creation_of_seed', model: Product.name
product_base = CSV.parse(File.open('/Users/tom/troptropcontent/api-billicopresto/db/seed_base_product.csv'))
product_base.each do |product|
	new_product = Product.create!(name: product[0], kind: product[1] )
	I18n.t 'seed.receipts.product_created', name: new_product.name, kind: new_product.kind
end

ap I18n.t 'seed.reseting_model_database', model: Receipt.name
Receipt.delete_all
ap I18n.t 'seed.creation_of_seed', model: Receipt.name
Retailer.all.each do |retailer|
	random_number_of_tills = (1..10).to_a.sample
	random_number_of_tills.times do |n|
		new_till = retailer.tills.create!(reference: n)
		random_number_of_receipts = (1..10).to_a.sample
		random_number_of_receipts.times do
			random_user = User.all.sample
			new_receipt = new_till.receipts.create!(reference: next_receipt_reference(retailer), user: random_user)
			I18n.t 'seed.receipts.receipt_created', retailer: retailer.name, reference: new_receipt.reference
			random_number_of_lines = (1..10).to_a.sample
			random_number_of_lines.times do
				byebug
				# new_receipt.receipt_lines
				# product = Product.where.not(id: new_receipt.receipt_lines.)
				# new_receipt.lines.create!()
			end
		end
	end
end
