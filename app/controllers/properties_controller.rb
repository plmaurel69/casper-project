class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_property, only: %i[update destroy show edit]


  def index
    @property = Property.all.where(user_id: current_user)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save!
    redirect_to property_path
  end

  def edit
  end

  def update
    @property.update(property_params)
    redirect_to property_path
  end

  def show
  end

  private

  def property_params
    params.require(:property).permit(:end_date, :start_date, :scheduled_payment_date, :billing_frequency, :rent_price, :rent_payment_status)
  end

  def find_property
    @property = Property.find(params[:id])
  end
end
