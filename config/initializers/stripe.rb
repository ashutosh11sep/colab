Rails.configuration.stripe = {
  publishable_key: "pk_test_ubtQx3LnoJBLWeGuwdWVQNb5",
  secret_key:      "sk_test_rjvGtQeIL4L9AaOCinsCNxUz",
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


