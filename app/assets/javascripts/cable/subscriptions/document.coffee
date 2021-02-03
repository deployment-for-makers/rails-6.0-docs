App.cable.subscriptions.create { channel: "DocumentChannel" },
  connected: () ->

  received: (data) ->
    console.log("Received data.")

    alert(data["title"])