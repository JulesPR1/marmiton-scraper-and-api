

# 🍴 Marmiton Parser and Unofficial API 🍲

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
