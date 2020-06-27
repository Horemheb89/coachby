class ContractsController < ApplicationController
  before_action :set_contract, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params_contract)
    @contract.save
  end

  def index
    @contracts = Contract.all
  end

  def show
  end

  private

  def params_contract
    params.require(:contract).permit(:coach_id, :athlete_id)
  end

end
