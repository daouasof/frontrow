import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: message => this.#insertMessageAndScroll(message) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #insertMessageAndScroll(message) {
    this.messagesTarget.insertAdjacentHTML("beforeend", message)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset(event)
  }

  disconnect() {
    console.log("Unsuscribed from channel")
    this.channel.unsubscribe()
  }
}
