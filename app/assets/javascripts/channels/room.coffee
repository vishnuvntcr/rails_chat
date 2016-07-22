App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    msg = data["message"]
    $("#message-show").append msg
    # 	Called when there's incoming data on the websocket for this channel
  speek: (msg)->
    @perform 'speek', message: msg

$(document).on 'keypress', '[data-behaviour~="room_speeker"]', (event) ->
	if event.keyCode is 13
		App.room.speek event.target.value
		event.target.value = ''
		event.preventDefault()