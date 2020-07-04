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
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def params_contract
    params.require(:contract).permit(:athlete_id)
  end
end
