class PropertyContractsController < ApplicationController
  before_action :find_property, only: %i[new update destroy edit show]

  def index
    @contracts = PropertyContract.all
  end

  def show
    @contract = PropertyContract.all.where(property_id: @property.id).first
    @property = Property.find(@property.id)
    @user = User.find(@contract.user.id)
    @owner = User.find(@property.user_id)

    respond_to do |format|
      format.html { render template: 'property_contracts/show' }
      format.pdf do
        render  pdf: "Contrat de Location",
                template: "property_contracts/show.html.erb",
                formats: :HTML,
                encoding: 'utf8'
      end
    end
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

  def property_params
    params.require(:property).permit(:address, :rental_status, :size, :property_name, :property_type, :property_amount)
  end

  def find_property
    @property = Property.find(params[:property_id])
  end

end
