# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Nettoyer la base de donnée.
Item.destroy_all
# Faire une requête http au serveur heroku
url = "https://hdv-watcher-3be496b8731a.herokuapp.com/items"
json_data = URI.open(url).read
# Transformer le JSON en fichier traitable
datas = JSON.parse(json_data)

# Itérer sur les objets reçu pour créer les objets en local
datas.each do |data|
    puts data["name"]
    item = Item.new(
        name: data["name"],
        img_url: data["img_url"],
        f_xp: data["f_xp"],
        unit_price: [],
        tenth_price: [],
        hundred_price: [],
        scrap_date: [],
        xp_quantity: data["xp_quantity"],
        ressource_type: data["ressource_type"],
        must_buy: data["must_buy"],
        )
    
    item.unit_price.concat(data["unit_price"])
    item.tenth_price.concat(data["tenth_price"])
    item.hundred_price.concat(data["hundred_price"])
    item.scrap_date.concat(data["scrap_date"])
    item.save
end