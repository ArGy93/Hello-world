class ModalTabsController

  constructor: ->
    @change_tabs()

  change_tabs: ->
    $('.modal__tabs-item').click (e) =>
      e.stopPropagation()
      $target = $(e.currentTarget)
      tabID = $target.data('tab-head')
      @activate_tab $target, tabID

  activate_tab: ($target, tabID) ->
    $($target)
      .addClass('active')
      .siblings()
      .removeClass('active')
      .closest('.modal__tabs')
      .siblings('.modal__content')
      .fadeOut(100)
      .filter((index, el) -> $(el).data('tab-body') is tabID)
      .fadeIn(600)

$(document).on 'turbolinks:load', ->
  window.modalTabs = new ModalTabsController()