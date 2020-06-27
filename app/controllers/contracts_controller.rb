class ContractsController < ApplicationController
  before_action :set_contract, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def new
  end

  def create
  end

  def show
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
