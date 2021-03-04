const newPostModal = () => {
  const createBtn = document.querySelector("#new-post-btn");
  const createForm = document.querySelector(".new-post-form");

  if (createBtn) {
    createBtn.addEventListener('click', (event) => {
      event.preventDefault();
      if (createForm.style.display === "none" || createForm.style.display === "") {
        createForm.style.display = "block";
      } else {
        createForm.style.display = "none";
      }
    });
  };
};

export { newPostModal };