class RoundsController

  constructor: ->
    @setup_ticket_price_calculator()

  setup_ticket_price_calculator: ->
    $('#round_price, #round_tickets_amount').change (e) ->
      tickets_amount = $('#round_tickets_amount').val()
      round_price = $('#round_price').val()
      $('#round_ticket_price').val(round_price/tickets_amount)

$(document).ready ->
  window.rounds = new RoundsController()