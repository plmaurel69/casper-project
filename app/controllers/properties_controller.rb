class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  before_action :find_property, only: %i[update destroy show edit]


  def index
    @properties = Property.all.where(user_id: current_user)
    @property_1 = Property.find(1)
    @property_2 = Property.find(2)
    @property_3 = Property.find(3)
    @balances = Income.sum(:amount) - Expense.where(state: 'paid').sum(:amount)
    @expense_data_property1 = Expense.where(balance_sheet_id: 1).group_by_month(:payment_date).sum(:amount)
    @income_data_property1 = Income.where(balance_sheet_id: 1).group_by_month(:payment_date).sum(:amount)
    @balance_data_property1 = {}
      @expense_data_property1.each_key do |key|
        if @income_data_property1[key]
          @balance_data_property1[key] = @income_data_property1[key] - @expense_data_property1[key]
        end
    end

    @expense_data_property2 = Expense.where(balance_sheet_id: 2).group_by_month(:payment_date).sum(:amount)
    @income_data_property2 = Income.where(balance_sheet_id: 2).group_by_month(:payment_date).sum(:amount)
    @balance_data_property2 = {}
    @expense_data_property2.each_key do |key|
        if @income_data_property2[key]
          @balance_data_property2[key] = @income_data_property2[key] - @expense_data_property2[key]
        end
    end

    @expense_data_property3 = Expense.where(balance_sheet_id: 3).group_by_month(:payment_date).sum(:amount)
    @income_data_property3 = Income.where(balance_sheet_id: 3).group_by_month(:payment_date).sum(:amount)
    @balance_data_property3 = {}
    @expense_data_property3.each_key do |key|
      if @income_data_property3[key]
      @balance_data_property3[key] = @income_data_property3[key] - @expense_data_property3[key]
      end
    end


    @contracts = PropertyContract.all
    @expenses = Expense.all
    @incomes = Income.all
    @data = Expense.group(:amount).count
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
    @balances = BalanceSheet.all.where(property_contract_id: @property.id)
    @expense_data_property1 = Expense.where(balance_sheet_id: 1, state: 'paid').sum(:amount)
    @income_data_property1 = Income.where(balance_sheet_id: 1).sum(:amount)
    @roi = @income_data_property1 - @expense_data_property1
    @contracts = PropertyContract.all.where(property_id: @property.id)
    @expenses = Expense.all.where(property_contract_id: @property.id)
    # @users = PropertyContract.all.where(property_id: @property_contract.user.id)
    @message = Message.new
  end


  def user_first_name
  @user = Property.find(params[:id]).user_id
  end

  private

  def property_params
    params.require(:property).permit(:address, :rental_status, :size, :property_name, :property_type, :property_amount)
  end

  def find_property
    @property = Property.find(params[:id])
  end
end
