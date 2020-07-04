class DosesController < ApplicationController
  def new
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new
    authorize @dose
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new(dose_params)
    authorize @dose
    @program = @meal.program
    @dose.meal = @meal
    date = @meal.start_time
    @dose.save
    redirect_to program_meals_path(@program, date: date)
  end

private

  def dose_params
    params.require(:dose).permit(:quantity, :ingredient_id)
  end
end
