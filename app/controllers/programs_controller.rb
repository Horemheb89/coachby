class ProgramsController < ApplicationController

  def new
    @program = Program.new
    authorize @program
    @contract = Contract.find(params[:contract_id])
    @programs = Program.where(contract: @contract).sort_by { |program| program.created_at }
    @latest_program = @programs[-1]
  end

  def create
    @contract = Contract.find(params[:contract_id])
    @program = Program.new(program_params)
    authorize @program
    @program.contract = @contract
    if @program.save
      redirect_to program_path(@program)
    end
  end

  def show
    # @contract = Contract.find(params[:contract_id])
    @program = Program.find(params[:id])
    authorize @program
    @trainings = Training.all
  end

  def index
    @programs = policy_scope(Program)
    @meals = Meal.all
    @contract = Contract.find(params[:id])
    @programs = Program.where(contract: @contract).sort_by { |program| program.created_at }
    @latest_program = @programs[-1]


  end

  def index_clients
    skip_authorization
    @meals = Meal.all
    @contract = Contract.find(params[:id])
    @programs = Program.where(contract: @contract)
  end

  private

  def program_params
    params.require(:program).permit(:proteins_target, :fats_target, :carbs_target, :contract_id)
  end
end
