class PropertyContractsController < ApplicationController
  before_action :find_contract, only: %i[new update destroy edit]

  def index
    @contracts = PropertyContract.all
  end

  def show
    @contract = PropertyContract.all.where(property_id: @property)
  end

  def new
    @property_contract = PropertyContract.new
  end

  def create
    @contract = PropertyContract.new(contract_params)
    @property = Property.find(params[:property_id])
    @contract.property = @property
    @user = User.new(user_params)
    @user.password = 'testtest'

    if @user.save!
      @contract.user = @user
      @contract.save!
    end
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
    params.require(:property_contract).permit(:end_date, :start_date, :scheduled_payment_date, :billing_frequency, :rent_price, :rent_payment_status)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :gender, :profession, :professional_status, :birth_date, :user_type)
  end

  def find_contract
    @property = Property.find(params[:property_id])
  end
end
