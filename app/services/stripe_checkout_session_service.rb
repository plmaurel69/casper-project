class StripeCheckoutSessionService
  def call(event)
    expense = Expense.find_by(checkout_session_id: event.data.object.id)
    expense.update(state: 'paid')
  end
end
