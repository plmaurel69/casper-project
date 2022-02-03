class BalanceSheetsController < ApplicationController
  before_action :find_balance, only: %i[update destroy show edit]

  def index
    @balances = BalanceSheet.all
  end

  def new
    @balance = BalanceSheet.new
  end

  def create
    @balance = BalanceSheet.new(balance_params)
    @balance.user = current_user
    @balance.save!
    redirect_to balances_path
  end

  def edit
  end

  def update
    @balance.update(balance_params)
    redirect_to balances_path
  end

  def destroy
    @balance.destroy
    redirect_to balances_path
  end

  def show
  end

  private

  def balance_params
    params.require(:balance_sheet).permit(:type, :amount, :type_description, :paid, :payment_date)
  end

  def find_balance
    @balance = BalanceSheet.find(params[:id])
  end

end
