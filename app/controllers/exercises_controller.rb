class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
    authorize @exercise
  end

  def create
    @exercise = Exercise.new(exercise_params)
    authorize @exercise
    if @exercise.save
      redirect_to program_trainings_path(@exercise)
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :rounds, :reps, :weight, :rest_time)
  end
end
