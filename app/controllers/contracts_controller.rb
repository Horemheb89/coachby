class ContractsController < ApplicationController
  before_action :set_contract, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @contract = Contract.new
    authorize @contract
  end

  def create
    @contract = Contract.new(params_contract)
    authorize @contract
    @contract.coach = current_user
    if @contract.save
      redirect_to contracts_path(@contract)
    end
  end

  def index
    @user = current_user
    @contracts = policy_scope(Contract)
  end

  def show
    authorize @contract
    @meals = Meal.joins(program: [:contract]).where(programs: { contract_id: @contract.id })
    @meals_today = @meals.select { |meal| meal.start_time == Date.today }

    @sessions = Session.joins(program: [:contract]).where(programs: { contract_id: @contract.id })
    @sessions_today = @sessions.select {|sessions| session.start_time = Date.today }
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def params_contract
    params.require(:contract).permit(:athlete_id)
  end
end
