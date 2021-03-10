const addSocials = () => {
const socialsButton = document.querySelector(".add-socials-button");
const inputRender = document.querySelector(".input-form-holder");

if (socialsButton) {
  socialsButton.addEventListener('click', (event) => {
    event.preventDefault();
    if (inputRender.style.display === "none" || inputRender.style.display === "") {
      inputRender.style.display = "block";
      socialsButton.style.display = "none"
    } else {
      inputRender.style.display = "none"
    }
  });
};

};

export { addSocials };