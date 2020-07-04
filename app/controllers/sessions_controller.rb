class SessionsController < ApplicationController

  def index
    @program = Program.find(params[:program_id])
    @sessions = Session.all
  end

  def show

  end

  def new
    @session = Session.new
    @program = Program.find(params[:program_id])
  end

  def create
    @program = Program.find(params[:program_id])

    @session = Session.new(session_params)
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
