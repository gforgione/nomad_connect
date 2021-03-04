import consumer from "./consumer";

const initPostCable = () => {
  const commentsContainer = document.querySelectorAll('.comments-section');
  commentsContainer.forEach((elm) => {
    const id = elm.dataset.postId;

    consumer.subscriptions.create({ channel: "PostChannel", id: id }, {
      received(data) {
        elm.insertAdjacentHTML('beforeend', data)
      },
    });
  })
}

export { initPostCable };