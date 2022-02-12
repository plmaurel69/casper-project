class PropertyContractsController < ApplicationController

  def index
    @contracts = PropertyContract.all
  end

  def show
    @property_contract = PropertyContract.find(params[:id])
    @property = @property_contract.property
    @user = User.find(@property_contract.user.id)
    @owner = User.find(@property.user_id)

    respond_to do |format|
      format.html { render template: 'property_contracts/show' }
      format.pdf do
        render  pdf: "Contrat_de_Location",
                template: "property_contracts/show.html.erb",
                formats: :HTML,
                encoding: 'utf8'
      end
    end
  end

  def new
    @property_contract = PropertyContract.new
    @property = @property_contract.property
  end

  def create
    @property_contract = PropertyContract.new(contract_params)
    @property = Property.find(params[:property_id])
    @property_contract.property = @property
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
    @property_contract.update(contract_params)
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

end
