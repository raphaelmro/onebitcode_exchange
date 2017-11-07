$(document).ready ->
  $('#quantity').change () ->
    update_value()

  $('.exchange').click (e) ->
    e.preventDefault()

    selected_text_local = $('#currency').find(":selected").val()
    selected_text_dest= $('#currency_destination').find(":selected").val()
    support = $('#currency').find(":selected").val()

    alert("Local: " + selected_text_local)
    alert("Dest: " + selected_text_dest)
    alert("Support: " + support)

    $('#currency').val(selected_text_dest)
    $('#currency_destination').val(support)

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
