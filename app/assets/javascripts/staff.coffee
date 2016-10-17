
$(document).on 'turbolinks:load', () =>
  $slide_btn = $('.staff_info .slide_btn')
  $slide_btn.click () ->
    $(this).toggleClass('active')
  $('.staff_info .slide iframe').load () ->
    $slide_btn.removeClass('loading')

