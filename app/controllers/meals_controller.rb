class MealsController < ApplicationController

  def new
    @meal = Meal.new
    # @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
  end

  def create
    # @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
    @meal = Meal.new(meal_params)
    @meal.program = @program
    if @meal.save
      redirect_to program_meals_path(@program)
    end
  end

  def index
    @meals = Meal.all
      if params["date"]
        @meals_date = Meal.where(start_time: params["date"])
      else
        @meals_date = Meal.all
      end
    # @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
    @labels = ["protein", "lipid", "carbs"]
    # ORDER = %w[Petit-dejeuner dejeuner gouter diner]
    # <%= column_chart @meals_date.map { |meal| [meal.name, calorie(meal)].values_at(*ORDER) } %>
    @meal_type = { "petit-dejeuner" => 0, "dejeuner" => 0, "gouter" => 0, "diner" => 0 }

    # create a new meal
    @meal = Meal.new
    @meal.start_time = params["date"]

    # create a new dose for a meal in index
    @dose = Dose.new

  end

  def show
    @meal = Meal.find(params[:id])
    @total_cal = calorie(@meal)
    @dose = Dose.new
    @macro_meal = macro(@meal)
  end

  private

  def calorie(meal)
    total_cal = 0
    meal.doses.each do |dose|
      total_cal += (dose.ingredient.proteins) * 4
      total_cal += (dose.ingredient.fats) * 9
      total_cal += (dose.ingredient.carbs) * 4
    end
    total_cal
  end

  def macro(meal)
    protein = 0
    lipid = 0
    carbs = 0
    meal.doses.each do |dose|
      protein += (dose.ingredient.proteins * dose.quantity)/100
      lipid += (dose.ingredient.fats * dose.quantity)/100
      carbs += (dose.ingredient.carbs * dose.quantity)/100
    end
      macros = ["Protein", protein], ["Lipid", lipid], ["Carbs", carbs]
  end

  def meal_params
    params.require(:meal).permit(:name, :start_time)
  end


   def dose_params
    params.require(:dose).permit(:quantity, :ingredient_id, :meal_id)
  end
end
