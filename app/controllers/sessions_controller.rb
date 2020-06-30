class SessionsController < ApplicationController
  def new
    @session = Session.new
    @program = Program.find(params[:program_id])
  end

  def create
    @program = Program.find(params[:program_id])
    @session = Session.new(session_params)
    @session.program = @program
    if @session.save
      redirect_to program_sessions_path(@program)
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :start_time)
  end
end
