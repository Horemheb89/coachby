class ProgramsController < ApplicationController

  def new
    @program = Program.new
    @contract = Contract.find(params[:contract_id])
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @program = Program.new(program_params)
    @program.contract = @contract
    if @program.save
      redirect_to program_path(@program)
    end
  end

  def show
    # @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:id])
  end

  def index
    @programs = Program.all
  end

  private

  def program_params
    params.require(:program).permit(:proteins_target, :fats_target, :carbs_target, :contract_id)
  end
end


