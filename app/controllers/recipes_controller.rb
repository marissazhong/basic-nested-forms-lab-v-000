class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:title, ingredients:
      [:recipe_ingredients_attributes_0_name,
        :recipe_ingredients_attributes_0_quantity],
        :recipe_ingredients_attributes_1_name,
        :recipe_ingredients_attributes_1_quantity])
  end
end
