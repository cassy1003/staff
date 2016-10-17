#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$(document).on 'turbolinks:load', () =>
  default_val = ':'
  $search = $ '.side_nav .search'
  $input = $search.find '[name=input]'
  $select_sf = $search.find '[name=strength_finder]'
  $select_st = $search.find '[name=staff_type]'
  $other_query = $search.find '.other_query'

  search = () ->
    inputs = $input.val().toLowerCase().split /\s+/
    select_sf = $select_sf.val()
    $('.staff').each (i) ->
      $(@).toggle inputs.filter((input) =>
        $(@).data('keyword').toLowerCase().includes(input)
      ).length is inputs.length and $(@).data('strength_finder').includes(select_sf)

  $input.on 'input', () -> search()
  $select_sf.on 'change', () -> search()

  $other_query.find('.btn').on 'click', () ->
    $(@).find('.show_btn').toggle()
    $(@).find('.hide_btn').toggle()
    $other_query.toggleClass 'active'
    $select_sf.val(default_val).change()

