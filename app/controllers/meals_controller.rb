class MealsController < ApplicationController

  def new
    @meal = Meal.new
    @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
    @meal = Meal.new(meal_params)
    @meal.program = @program
    if @meal.save
      redirect_to contract_program_meals_path(@contract, @program)
    end
  end


  def index
    @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:program_id])
    @meals = Meal.all
  end

  # def dashboard_day
  #   @meals = Meal.all
  #   @meals_day = []
  #   @meals.each do |meal|
  #     if meal.start_time == params['format']
  #       @meals_day << meal
  #     end
  #   end
  #   @meals_day
  # end

  def show
    @meal = Meal.find(params[:id])
    @total_cal = calorie(@meal)
    @dose = Dose.new
    @macro_meal = macro(@meal)
  end

  private

  # def calorie(meal)
  #   total_cal = 0
  #   meal.doses.each do |dose|
  #     total_cal += (dose.ingredient.protein) * 4
  #     total_cal += (dose.ingredient.lipid) * 8
  #     total_cal += (dose.ingredient.carbs) * 4
  #   end
  #   total_cal
  # end

  # def macro(meal)
  #   protein = 0
  #   lipid = 0
  #   carbs = 0
  #   meal.doses.each do |dose|
  #     protein += dose.ingredient.protein
  #     lipid += dose.ingredient.lipid
  #     carbs += dose.ingredient.carbs
  #   end
  #     macros = ["Protein", protein], ["Lipid", lipid], ["Carbs", carbs]
  # end

  def meal_params
    params.require(:meal).permit(:type, :name, :start_time)
  end

end
