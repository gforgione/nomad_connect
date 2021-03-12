import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
    
    const id = messagesContainer.dataset.chatroomId;
    const userId = document.querySelector(".nav-username").dataset.currentUser;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data)
        
        const lastMsg = messagesContainer.querySelector(".message:last-child")
        console.log(lastMsg.dataset.userId);
        console.log(userId);

        if (lastMsg.dataset.userid !== userId) {
          lastMsg.classList.remove("current-user-message");
        } else {
          document.getElementById("new_message").reset();
        }

        messagesContainer.scrollTop = messagesContainer.scrollHeight;

      },
    });
  }
}

export { initChatroomCable };