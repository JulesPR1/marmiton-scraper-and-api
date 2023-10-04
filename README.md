

# 🍴 Marmiton Scraper and Unofficial API 🍲

This project is a simple Rails application that parses recipes from marmiton.org and stores them in a database. The recipes are then consultable and filterablr from an API.

## 📚 Versions

- Ruby 2.6.6
- Rails 6.0.6.1

## 💎 Additional gems

- HTTParty
- Colorize
- Nokogiri (normally already included in Rails)

Make sure to run `bundle install` to install all the gems.

## 💾 Database creation and initialization

To create and initialize the database, run:

```
rails db:schema:load 
```

## 🍽️ How to parse recipes

To parse recipes and save them in the database, simply launch the following command in your `rails console`:

```
ParseRandomRecipesJob.perform_now(number_of_recipes_to_parse)
```

If a recipe is already in the database, it will not be parsed again.

## 🍲 API routes

To access the collected data, launch the server using the `rails s` command. 

Available routes :
- `GET /recipes/random/:nb_recipes`: returns a random selection of `nb_recipes` recipes.
- `GET /recipes/find-by-ingredient/:ingredient`: returns all recipes that include `ingredient`.
- `GET /recipes/find-by-ustensil/:ustensil`: returns all recipes that require `ustensil`.
- `GET /recipes/find-by-name/:name`: returns all recipes that match `name`.

Exemple :
`GET http://127.0.0.1:3000/recipes/random/1`

```
[
	{
		"name": "Toast d'aubergines au grille-pain",
		"difficulty": "très facile",
		"price_level": "bon marché",
		"ingredients": [
			"1 aubergine",
			"10 tomates cerise",
			"100 g de fromage de chèvre",
			"1⁄2 concombre",
			"100 g de thon",
			"1 botte de radis rose"
		],
		"ustensils": [],
		"instructions": [
			{
				"étape 1": "Couper des tranches épaisses d'aubergine."
			},
			{
				"étape 2": "Les faire cuire en les plaçant dans le grille-pain puissance maximale. Répéter 3 fois l'opération."
			},
			{
				"étape 3": "Mélanger le chèvre et le thon."
			},
			{
				"étape 4": "Laver les radis et le concombre et les couper en fines rondelles. \nLaver les tomates cerise et les couper en 2."
			},
			{
				"étape 5": "Tartiner les toasts d'aubergine de chèvre et garnir avec les rondelles de radis, les tomates, parsemer d'herbes fraiche."
			}
		],
		"total_time": "22 min",
		"prep_time": "12 min",
		"reste_time": "-",
		"cook_time": "10 min"
	}
]
```
