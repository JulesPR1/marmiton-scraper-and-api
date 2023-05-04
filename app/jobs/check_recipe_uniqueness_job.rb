class CheckRecipeUniquenessJob < ApplicationJob
  queue_as :default

  def perform(*args)
    recipes = Recipe.all
    recipes.each do |recipe|
      if Recipe.where(name: recipe.name).count > 1
        puts "Recipe #{recipe.name} is duplicated".red
      end
    end

    return "done"
  end
end
