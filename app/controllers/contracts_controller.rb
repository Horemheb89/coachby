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
      redirect_to contracts_path
    end
  end

  def index
    @contracts = Contract.all
  end

  def show
  end

  private

  def params_contract
    params.require(:contract).permit(:athlete_id)
  end

end
