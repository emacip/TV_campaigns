$(document).ready ->

  $('[data-toggle="modal"]').on "click", (e) ->
    name = $(this).attr("id")
    $.ajax(type: "GET", url: '/votes/'+ name )
