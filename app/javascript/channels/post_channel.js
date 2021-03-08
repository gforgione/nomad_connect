import consumer from "./consumer";

const initPostCable = () => {
  const commentsContainer = document.querySelectorAll('.post-comments');
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