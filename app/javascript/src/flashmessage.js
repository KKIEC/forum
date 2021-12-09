$( () => {
  const flashMessage = $('div[id^="flash_"]');

  if (flashMessage) {
    setTimeout(() => {
      flashMessage.remove();
    }, 2000);
  };
});
