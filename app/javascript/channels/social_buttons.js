const addSocials = () => {
const socialsButtons = document.querySelectorAll(".add-socials-button");
const inputRender = document.querySelector(".input-form-holder");
socialsButtons.forEach((socialsButton) =>  {
if (socialsButton) {
  socialsButton.addEventListener('click', (event) => {
    event.preventDefault();
    debugger;
    if (socialsButton.parentElement.nextElementSibling.style.display === "none" || socialsButton.parentElement.nextElementSibling.style.display === "") {
      socialsButton.parentElement.nextElementSibling.style.display = "block";
      socialsButton.style.display = "none"
    } else {
      socialsButton.parentElement.nextElementSibling.style.display = "none"
    }
  });
};

});
};
export { addSocials };