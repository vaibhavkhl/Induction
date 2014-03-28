ready = ->
  $('#users').dataTable()

$(document).ready(ready)
$(document).on('page:load', ready)  