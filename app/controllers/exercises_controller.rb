class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to program_sessions_path(@exercise)
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :rounds, :reps, :weight, :rest_time)
  end
end
