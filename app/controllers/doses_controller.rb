class DosesController < ApplicationController
  def new
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @dose = Dose.new(dose_params)
    @program = @meal.program
    @dose.meal = @meal
    date = @meal.start_time

    if @dose.save
      redirect_to program_meals_path(@program, date: date)
    end
  end

private

  def dose_params
    params.require(:dose).permit(:quantity, :ingredient_id)
  end
end
