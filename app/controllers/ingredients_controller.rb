class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    end
    # @list = find_macro(@ingredient)
  end

  def index
    @ingredient = Ingredient.new
    if params[:query].present?
      @ingredients = Ingredient.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @ingredients = Ingredient.all
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @macros = ["Protein", @ingredient.proteins], ["Fats", @ingredient.fats], ["Carbs", @ingredient.carbs]
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:quantity, :unit, :name, :protein, :lipid, :carbs)
  end

  # def find_macro(ingredient)
  #   products = Openfoodfacts::Product.search(ingredient.to_s, locale: 'world', page_size: 3)
  #   products.map { |product| product.product_name }
  # end
end
