# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (index) ->
    $(this).attr 'data-pos', index + 1
    return
  return

ready = ->
  set_positions()
  console.log('Setting data-pos')

  $('.sortable').sortable()
  console.log('Got sortable')

  $('.sortable').sortable().bind 'sortupdate', (e,ui) ->
    updated_order = []
    set_positions()
    $('.card').each (index) ->
      updated_order.push
        id: $(this).attr('data-id')
        position: index + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolio/sort'
      data: order: updated_order
    return
  console.log('Got sortable binding')
  return

$(document).ready(ready)
