document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const favoriteSubmit = (e) => {
    e.preventDefault();
    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
      favoriteInput.value = "";

    const newLi = document.createElement("li");
      newLi.textContent = favorite;

    const places = document.getElementById("sf-places");
      places.appendChild(newLi);
  };

  const liSubmit = document.querySelector(".favorite-submit");
  liSubmit.addEventListener("click", favoriteSubmit);


  // --- your code here!



  // adding new photos

  // --- your code here!



});
