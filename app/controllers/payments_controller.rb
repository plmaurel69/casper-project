class PaymentsController < ApplicationController
  def new
    @expense = Expense.where(state: 'pending').find(params[:expense_id])
  end
end
