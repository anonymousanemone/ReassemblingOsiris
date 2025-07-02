document.addEventListener("mouseover", function (event) {
  const target = event.target;
  const input = document.getElementById("lineinput-field");

  if (target.classList.contains("vorple-commandlink")) {
    console.log("tried")
    const command = target.getAttribute("data-command");
    if (command) {
      if (!input.dataset.originalColor) {
        input.dataset.originalColor = input.style.color;
      }

      input.value = command;
      input.style.color = "red";
    }
  }
});

document.addEventListener("mouseout", function (event) {
  const target = event.target;
  const input = document.getElementById("lineinput-field");

  if (target.classList.contains("vorple-commandlink") && input) {
    input.value = "";

    // Restore original colors if available
    if (input.dataset.originalColor) {
      input.style.color = input.dataset.originalColor;
    }
  }
});
