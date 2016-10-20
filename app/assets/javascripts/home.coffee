
$(document).on 'turbolinks:load', () =>
  $('[type=submit]').click () ->
    $(@).addClass('disabled').after '<i class="fa fa-spinner loading"></i>'

  $('.downloaded').fadeIn 'slow'
  setTimeout () ->
    $('.downloaded').fadeOut 'slow'
  , 1000

