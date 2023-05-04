class Recipe < ApplicationRecord
  def get_hash
    {
      name: self.name,
      difficulty: self.difficulty,
      price_level: self.price_level,
      ingredients: JSON.parse(self.ingredients),
      ustensils: JSON.parse(self.ustensils),
      instructions: JSON.parse(self.instructions),
      total_time: self.total_time,
      prep_time: self.prep_time,
      reste_time: self.reste_time,
      cook_time: self.cook_time
    }
  end
end
