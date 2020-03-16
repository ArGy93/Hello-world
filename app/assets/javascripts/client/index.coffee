class IndexController

  constructor: ->
    @activate_buttons()

  activate_buttons: ->
    $('.price-buttons').click (e) ->
      $this = $(this)
      id = $this.attr('for')
      role = $this.attr('role')
      input = $(id)
      value = Number(input.val())
      if role == 'up'
        value += 1 if value < input.attr('max')
      else
        value -= 1 if value > 1
      input.val(value)

$(document).on 'turbolinks:load', ->
  window.index = new IndexController()