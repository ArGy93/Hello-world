class ModalController

  constructor: ->
    @open_menu()
    @close_menu()
    @open_modal()

  open_menu: ->
    $('.hamburger__icon').click () ->
      $('.modal__menu').addClass('active')

  open_modal: ->
    $('.js-btn').click (e) =>
      e.stopPropagation()
      dataId = $(e.currentTarget).data('call')
      $('[data-target="' + dataId + '"]').addClass('active')   

  close_menu: ->
    $('.modal__close').click () ->
      $(this).closest('.modal').removeClass('active')

$(document).on 'turbolinks:load', ->
  window.modal = new ModalController()