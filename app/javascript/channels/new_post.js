const newPostModal = () => {
  const createBtn = document.querySelector("#new-post-btn");
  const modal = document.querySelector(".new-post-form");

  createBtn.addEventListener('click', (event) => {
    event.preventDefault();
    
    if (modal.style.display === "none") {
      modal.style.display = "block";
    } else {
      modal.style.display = "none";
    }
  });
};


export { newPostModal };