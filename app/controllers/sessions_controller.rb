class SessionsController < ApplicationController

  def index
    @session = Session.find(params[:program_id])
    @sessions = policy_scope(Session).includes(:exercises)
    @sessions = Session.where(program_id: @program)
  end

  def show
    @session = Session.find(params[:id])
    @sessions = policy_scope(Session).includes(:exercises)
    authorize @sessions
    @exercises = Exercise.where(session: @session)
  end

  def new
    @session = Session.new
    authorize @session
    @program = Program.find(params[:program_id])
  end

  def create
    @program = Program.find(params[:program_id])

    @session = Session.new(session_params)
    authorize @session
    @session.program = @program
    if @session.save
      redirect_to program_path(@program)
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :start_time, exercises_attributes: [:id, :name, :rounds, :reps, :weight, :rest_time, :_destroy])
  end
end
