
function HoverFillLink(event) {
  // const outputArea = document.getElementById("vorple");
  const outputArea = document.body;

  // if (!outputArea) {
  //   console.error("Required element not found.");
  //   return;
  // }

  outputArea.addEventListener("mouseover", function (event) {
    const link = event.target.closest("a.vorple-commandlink");
    if (link && outputArea.contains(link)) {
      const command = link.getAttribute("data-command");
      console.log("Hovered command:", command);
      if (command) {
        vorple.prompt.setValue(command);
      }
      const input = document.getElementById("lineinput-field");
      // console.log(input)
      if (input) {
        input.style.color = "var(--prefill-color)";
      }
    }
  });

  outputArea.addEventListener("mouseout", function (event) {
    const link = event.target.closest("a.vorple-commandlink");
    if (link && outputArea.contains(link)) {
      const input = document.getElementById("lineinput-field");
      if (input) {
        vorple.prompt.setValue("");
        input.style.color = input.dataset.originalColor || "";
      }
    }
  });
}

vorple.addEventListener("init", HoverFillLink);

