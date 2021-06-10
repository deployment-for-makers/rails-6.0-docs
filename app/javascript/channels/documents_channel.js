import consumer from "./consumer"

consumer.subscriptions.create(
  { channel: "DocumentChannel" },
  {
    connect() {},
    received(data) {
      console.log("Received data.")
      alert(data["title"])
    }
  }
)