$(document).ready ->
  $('#quantity').change ->
    if $('form').attr('action') == '/exchange'
      update_value()

  $('.exchange').click () ->
    local_currency = $('#currency').val()
    currency_destination = $('#currency_destination').val()

    $('#currency').val(currency_destination)
    $('#currency_destination').val(local_currency)
    update_value()

update_value = ->
  $.ajax '/exchange',
    type: 'POST'
    dataType: 'json'
    data: {
      currency: $("#currency").val(),
      currency_destination: $("#currency_destination").val(),
      quantity: $("#quantity").val()
    }
    error: (jqXHR, textStatus, errorThrown) ->
      alert textStatus
    success: (data, text, jqXHR) ->
      $('#result').val(data.value)
  return false;