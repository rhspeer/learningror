# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('[data-select~=brand]').change (event) ->
    brand_id = $(event.target).val()
    $.get "/brands/#{brand_id}/frames.json", (data) ->
      options = ''
      if data.length == 0
        options = '<option>No frames for that brand</option>'
      else
        for frame in data
          options += "<option value='#{frame.id}'>#{frame.name}</option>"

      $('[data-select~=frame]').html(options)
