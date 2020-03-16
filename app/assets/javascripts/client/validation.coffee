class ValidationsController
  constructor: ->
    @registration_form()

  registration_form: ->
    $('#registrationForm').on 'ajax:success', (e) ->
      $('#mobileInputAuth').val($('#mobileInput').val())
      $('.auth-tab').tab('show')


$(document).on 'turbolinks:load', ->
  window.validations = new ValidationsController()