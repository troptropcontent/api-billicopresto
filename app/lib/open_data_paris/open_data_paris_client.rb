# frozen_string_literal: true

require "httparty"

class OpenDataParis::OpenDataParisClient

  HOST = "https://opendata.paris.fr"

  def self.fetch_grocery_store(rows)
    url = "#{HOST}/api/records/1.0/search/?dataset=coronavirus-commercants-parisiens-livraison-a-domicile&q=&rows=#{rows}&facet=code_postal&facet=type_de_commerce&facet=fabrique_a_paris&facet=services&refine.type_de_commerce=Alimentation+g%C3%A9n%C3%A9rale+et+produits+de+premi%C3%A8re+n%C3%A9cessit%C3%A9"

    response = HTTParty.get(url)
    JSON.parse(response.body).dig("records")
  end
end
