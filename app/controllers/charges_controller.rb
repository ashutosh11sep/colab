class ChargesController < ApplicationController
def new
end
#byebug
def create
  #byebug
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
 StripeTransaction.create(
  :stripe_customer_id =>customer.id,
  :user_id =>current_user.id,
  :amount =>@amount,
  :stripe_transaction_id =>charge.id,
  )
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
end
