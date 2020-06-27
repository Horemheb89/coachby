class ContractsController < ApplicationController

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(params_contract)
    @contract.save
  end

  def show
  end

  private

  def params_contract
    params.require(:contract).permit(:user_id)
  end

end
