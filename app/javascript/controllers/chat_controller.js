import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { roomId: Number }

  connect() {
    this.subscription = consumer.subscriptions.create(
      { channel: "RoomChannel", room_id: this.roomIdValue },
      {
        received: (data) => this.#appendMessage(data)
      }
    )
  }

  disconnect() {
    if (this.subscription) this.subscription.unsubscribe()
  }

  #appendMessage(data) {
    const messages = document.getElementById("messages")
    const wrapper = document.createElement("div")
    wrapper.className = "message"
    wrapper.innerHTML = `<strong>${data.user_name}</strong>: ${data.content}`
    messages.appendChild(wrapper)
    messages.scrollTop = messages.scrollHeight
  }
}
