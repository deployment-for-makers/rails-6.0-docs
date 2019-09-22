class DocumentChannel < ApplicationCable::Channel
  def subscribed
    puts 'I will stream from visitor'
    # App.cable.subscriptions.subscriptions[0].send({ title: "Paul", body: "This is a cool chat app." })
    stream_from "document_channel"
  end

  def receive(data)
    ActionCable.server.broadcast("document_channel", data)
  end
end