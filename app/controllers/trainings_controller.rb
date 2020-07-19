class TrainingsController < ApplicationController

  def index
    @trainings = policy_scope(Training).where(program_id: params[:program_id])
    @program = Program.find(params[:program_id])
  end

  def show
    @training = Training.find(params[:id])
    @program = @training.program
    @trainings = policy_scope(Training).where(program_id: @program)
    authorize @trainings
    @exercises = Exercise.where(training: @training)
  end

  def new
    @training = Training.new
    authorize @training
    @program = Program.find(params[:program_id])
  end

  def create
    @program = Program.find(params[:program_id])

    @training = Training.new(training_params)
    authorize @training
    @training.program = @program
    if @training.save
      redirect_to program_path(@program)
    end
  end

  private

  def training_params
    params.require(:training).permit(:date, :start_time, exercises_attributes: [:id, :name, :rounds, :reps, :weight, :rest_time, :_destroy])
  end
end
