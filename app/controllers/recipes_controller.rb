class RecipesController < ApplicationController
  def random
    recipes = Recipe.all.sample(params[:nb_recipes].to_i)
    @recipes = []
    recipes.each do |recipe|
      @recipes << recipe.get_hash
    end
    render json: @recipes
  end

  def find_by_ingredient
    recipes = Recipe.where("ingredients LIKE ?", "%#{params[:ingredient]}%")
    @recipes = []
    recipes.each do |recipe|
      @recipes << recipe.get_hash
    end
    render json: @recipes
  end

  def find_by_ustensil
    recipes = Recipe.where("ustensils LIKE ?", "%#{params[:ustensil]}%")
    @recipes = []
    recipes.each do |recipe|
      @recipes << recipe.get_hash
    end
    render json: @recipes
  end

  def find_by_name
    recipes = Recipe.where("name LIKE ?", "%#{params[:name]}%")
    @recipes = []
    recipes.each do |recipe|
      @recipes << recipe.get_hash
    end
    render json: @recipes
  end
  
end
