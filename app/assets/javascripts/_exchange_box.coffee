$(document).ready ->
  $('#quantity').keyup () ->
    update_value()

  $('.exchange').click (e) ->
    e.preventDefault()
    local_currencyVal = $('#currency option:selected').val()
    local_currencyTxt = $('#currency option:selected').text()

    currency_destinationVal = $('#currency_destination option:selected').val()
    currency_destinationTxt = $('#currency_destination option:selected').text()

    $('#currency option:selected').val(currency_destinationVal)
    $('#currency option:selected').text(currency_destinationTxt)

    $('#currency_destination option:selected').val(local_currencyVal)
    $('#currency_destination option:selected').text(local_currencyTxt)


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
