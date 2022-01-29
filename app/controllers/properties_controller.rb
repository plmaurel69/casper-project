class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_property, only: %i[update destroy show edit]


  def index
    @properties = Property.all.where(user_id: current_user)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save!
    redirect_to properties_path
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
    params.require(:property).permit(:address, :rental_status, :size, :property_name, :property_type, :property_amount)
  end

  def find_property
    @property = Property.find(params[:id])
  end
end
