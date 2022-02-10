import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.propertyContractId;
    console.log(id)
    consumer.subscriptions.create({ channel: "PropertyContractChannel", id: id }, {
      received(data) {
        console.log(data)
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
    consumer.subscriptions.create("WebNotificationsChannel", {
      received(data) {
        new Notification(data["title"], { body: data["body"] })
      }
    })
  }
}

export { initChatroomCable };
