
$(document).on 'turbolinks:load', () =>
  $slide_btn = $ '.staff_info .slide_btn'
  $slide_btn.click () ->
    $(@).toggleClass 'active'
  $('.staff_info .slide iframe').load () ->
    $slide_btn.removeClass 'loading'

  $('.strength_finder a').click () ->
    $other_query = $ '.side_nav .search .other_query'
    $other_query.find('.btn .show_btn').hide()
    $other_query.find('.btn .hide_btn').show()
    $other_query.addClass 'active'
    $('select[name=strength_finder]').val($(@).html()).change()

