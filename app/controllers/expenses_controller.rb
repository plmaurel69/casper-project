class ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
  end

  def checkout
    expense = Expense.find(params[:id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price: Stripe::Price.create({
          unit_amount: expense.amount.to_i*100,
          currency: 'eur',
          product: Stripe::Product.create({
            name: expense.type
          })
        }),
        quantity: 1
      }],
      mode: 'payment',
      success_url: expense_url(expense),
      cancel_url: expense_url(expense)
    )
    expense.update(checkout_session_id: session.id)
    redirect_to new_expense_payment_path(expense)
  end

end
