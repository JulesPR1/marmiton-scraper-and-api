class ParseRandomRecipesJob < ApplicationJob
  queue_as :default

  def perform(nb_recipes=0)
    for i in 0..nb_recipes
      recipe = Recipe.new

      unparsed_data = HTTParty.get("https://www.marmiton.org/recettes/recette-hasard.aspx?v=2")
      parsed_data = Nokogiri::HTML(unparsed_data)
      recipe.name = parsed_data.css("h1").text

      unless Recipe.where(name: recipe.name).any?
        recipe_first_data = parsed_data.css(".iDYkZP").map(&:text)
        recipe.difficulty = recipe_first_data[1]
        recipe.price_level = recipe_first_data[2]

        recipe_time_infos = parsed_data.css(".RCP__sc-180phmr-0").css(".bzAHrL").map(&:text)
        recipe.total_time = recipe_time_infos[0]
        recipe.prep_time = recipe_time_infos[1]
        recipe.reste_time = recipe_time_infos[2]
        recipe.cook_time = recipe_time_infos[3]

        ingredients = parsed_data.css(".MuiGrid-item").map(&:text)
        ingredients.each do |ingredient|
          ingredient.strip!
        end
        recipe.ingredients = ingredients.to_json

        ustensils = parsed_data.css(".dUdOZp").css(".iLcXC").map(&:text)
        ustensils.each do |ustensil|
          ustensil.strip!
        end
        recipe.ustensils = ustensils.to_json

        instructions = parsed_data.css(".RCP__sc-1wtzf9a-3").map(&:text)
        instructions.each_with_index do |instruction, i|
          instruction_hash = {"étape #{i+1}" => instruction}
          instructions[i] = instruction_hash
        end
        recipe.instructions = instructions.to_json
        recipe.save
      else
        puts "Recipe #{recipe.name} already exists".red
        nb_recipes += 1
      end
    end
  end
end