class DosesController < ApplicationController
  def new
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new(dose_params)
    @dose.meal = @meal
    @dose.save
    redirect_to meal_path(@meal)
  end

private

  def dose_params
    params.require(:dose).permit(:quantity, :unit, :ingredient_id)
  end
end
