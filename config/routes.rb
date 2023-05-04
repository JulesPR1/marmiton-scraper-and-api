Rails.application.routes.draw do
  get 'recipes/random/:nb_recipes', to: 'recipes#random'
  get 'recipes/find-by-ingredient/:ingredient', to: 'recipes#find_by_ingredient'
  get 'recipes/find-by-ustensil/:ustensil', to: 'recipes#find_by_ustensil'
  get 'recipes/find-by-name/:name', to: 'recipes#find_by_name'
end
