App.cable.subscriptions.create { channel: "DocumentChannel" },
  connected: () ->

  received: (data) ->
    console.log("received data.")
    #@show_notification(data)
    alert(data["title"])