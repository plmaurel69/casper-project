class PropertyContractsController < ApplicationController
  before_action :find_contract, only: %i[update destroy show edit]

  def index
    @contracts = PropertyContract.all
  end

  def show
    @property_contract = PropertyContract.find(params[:id])
    @message = Message.new
  end

  def new
    @contract = PropertyContract.new
  end

  def create
    @contract = PropertyContract.new(contract_params)
    @propery = Property.find(params[:property_id])
    @contract.property = @property
    @contract.save!
  end

  def edit
  end

  def update
    @contract.update(contract_params)
  end

  def destroy
    @contract.destroy
  end

  private

  def contract_params
    params.require(:propertycontract).permit(:end_date, :start_date, :scheduled_payment_date, :billing_frequency, :rent_price, :rent_payment_status)
  end

  def find_contract
    @contract = PropertyContract.find(params[:id])
  end

end
