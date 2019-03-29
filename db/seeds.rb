require 'open-uri'

Dose.delete_all if Rails.env.development?
Ingredient.delete_all if Rails.env.development?
Cocktail.delete_all if Rails.env.development?

url = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json"


cocktails_array = JSON.parse(open(url).read)


cocktails_array.each do |cocktail|
  c = Cocktail.create!(name: cocktail["name"])
  p "Added #{c.name} to the list"
  cocktail["ingredients"].each do |ing|
    unless ing["ingredient"].nil?
      i = Ingredient.find_or_create_by!(name: ing["ingredient"])
      p "Added #{i.name} to the list"
      Dose.create(description: ing["amount"].to_s + " " + ing["unit"], ingredient: i, cocktail: c )
    end
  end
end
