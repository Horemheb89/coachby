class ContractsController < ApplicationController
  before_action :set_contract, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params_contract)
    @contract.coach = current_user
    if @contract.save
      redirect_to contract_path(@contract)
    end
  end

  def index
    @user = current_user
    @contracts = Contract.where(coach_id: @user.id)
  end

  def show
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def params_contract
    params.require(:contract).permit(:athlete_id)
  end
end
