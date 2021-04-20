const toggleWishlist = (evt) => {
  evt.preventDefault();

  const wishlist = document.querySelector(evt.currentTarget.dataset.wishlistDialog);
  wishlist.classList.toggle("hidden");
};

document.addEventListener("DOMContentLoaded", () => {
  const wishlistButtons = document.querySelectorAll('.wishlist-action');

  wishlistButtons.forEach((wishlistButton) => {
    wishlistButton.addEventListener("click", toggleWishlist);
  });
});
