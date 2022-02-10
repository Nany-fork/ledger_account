document.addEventListener("turbo:load", function () {
    const movementSelect = document.querySelector("#movement_movement_type_id");
    const movementFilt = document.querySelector("#movement_category");
    movementSelect.addEventListener("change", function (e) {
      movementFilt.innerHTML=''
      movementFilt.value=''
      const selectedMovement = e.target.value;
      console.log(selectedMovement)
      fetch(`/movement_categories/${selectedMovement}`)
        .then((response) => response.json())
        .then((data) => {
          for (const categoria of data) {
            var opt = document.createElement("option");
            opt.value = categoria.name;
            opt.innerHTML = categoria.name;
            movementFilt.appendChild(opt);
          }
        });
    });
  });
  