jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  console.log 'Set Stripe Key'
  payment.setupForm()

payment =
  handleStripeResponse: (status, response) ->
    console.log 'Handling Stripe response'
    if status == 200
      console.log 'Stripe was 200'
      console.log response.id
      console.log 'Submitting Form'
      $('#new_order').append($('<input type="hidden" name="stripe_token" />').val(response.id))
      $('#new_order')[0].submit()
    else
      $('input[type=submit]').removeAttr('disabled')
      console.log 'Stripe errored'
      console.log response.error.message
      $('#stripe-error').text(response.error.message).show()

  setupForm: ->
    console.log 'Setting up New Order Form'
    $('#new_order').submit ->
      console.log 'Submitting Form'
      $('input[type=submit]').attr('disabled', true)
      Stripe.card.createToken({ number: $('#card_number').val(), cvc: $('#cvc').val(), exp_month: $('#date_month').val(), exp_year: $('#date_year').val() }, payment.handleStripeResponse)
      false
