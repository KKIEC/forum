import Rails from '@rails/ujs';

let skipConfirmation = false;

Rails.confirm = function(message, element) {

  if (skipConfirmation) {
    return true;
  };

  const modal = document.getElementById("myModal");

  function onConfirm() {
    skipConfirmation = true;
    element.click();
    skipConfirmation = false;
  };

  modal.style.display = "block";

  const btnYes = document.getElementById("btnYes");
  const btnNo = document.getElementById("btnNo");

  btnYes.onclick = function() {
    modal.style.display = "none";
    onConfirm();
  };

  btnNo.onclick = function() {
    modal.style.display = "none";
  };

  return false;
};
