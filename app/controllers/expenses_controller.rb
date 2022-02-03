class ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
    # @payment = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
