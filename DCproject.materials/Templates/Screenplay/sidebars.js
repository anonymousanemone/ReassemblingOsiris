function toggleHelp(show) {
  document.getElementById("overlay").style.display = show ? "block" : "none";
  document.getElementById("helpPopup").style.display = show ? "flex" : "none";
}

function toggleFiles(show) {
  document.getElementById("overlay").style.display = show ? "block" : "none";
  document.getElementById("file-explorer").style.display = show ? "flex" : "none";
}

function removeOverlay() {
  document.getElementById("overlay").style.display = "none";
  document.getElementById("helpPopup").style.display = "none";
  document.getElementById("file-explorer").style.display = "none";
}

function switchTab(tabName) {
  // Buttons
  document.querySelectorAll('.tab-button').forEach(btn => {
    btn.classList.remove('active');
  });

  // Tabs
  document.querySelectorAll('.help-content').forEach(tab => {
    tab.classList.remove('active');
  });

  // Activate new tab and button
  document.querySelector(`.tab-button[onclick*="${tabName}"]`).classList.add('active');
  document.getElementById(`tab-${tabName}`).classList.add('active');
}


  function insertCommand(command) {
    const input = document.querySelector('input[type="text"]');
    if (input) {
      input.value = command + ' ';
      input.focus();
    }
  }

    function goHome() {
    window.location.href = "index.html"; // or your home URL
    }

function moveGameport(event) {
    // Wait for Vorple to fully load
    const observer = new MutationObserver(() => {
      const vorpleElement = document.getElementById("vorple");
      const container = document.getElementById("game-container");

      if (vorpleElement && container && !container.contains(vorpleElement)) {
        container.appendChild(vorpleElement);
        console.log("Vorple moved into #game-container.");
        observer.disconnect(); // stop observing once done
      }
    });

    observer.observe(document.body, { childList: true, subtree: true });
  }

  vorple.addEventListener("init", moveGameport);

  // Mobile/tablet support: "wait for any key" pauses (used ~177 times in the
  // story) rely on a real keydown event, which touchscreens without a
  // hardware keyboard never fire. This lets a tap satisfy them instead.
  function enableTapToContinue() {
    // Bind directly to the interpreter's own output element, not a wrapper
    // div, so taps on the scene image / d-pad / command links elsewhere on
    // the page are never mistaken for "continue". This reference stays
    // valid even after moveGameport() relocates #vorple into #game-container,
    // since appendChild moves the existing node rather than cloning it.
    const target = document.getElementById("vorple");
    if (!target) return;
    const isTouchDevice = window.matchMedia && window.matchMedia("(pointer: coarse)").matches;
    let hintShown = false;
    let tapHandler = null;

    vorple.addEventListener("expectKeypress", function () {
      if (isTouchDevice && !hintShown && typeof toastr !== "undefined") {
        toastr.info("Tap anywhere to continue", "", { timeOut: 2500 });
        hintShown = true;
      }

      tapHandler = function () {
        target.removeEventListener("touchstart", tapHandler);
        target.removeEventListener("click", tapHandler);
        tapHandler = null;
        vorple.prompt.queueKeypress(" ");
      };
      target.addEventListener("touchstart", tapHandler);
      target.addEventListener("click", tapHandler);
    });

    vorple.addEventListener("submitKeypress", function () {
      if (tapHandler) {
        target.removeEventListener("touchstart", tapHandler);
        target.removeEventListener("click", tapHandler);
        tapHandler = null;
      }
    });
  }

  vorple.addEventListener("init", enableTapToContinue);

  // During a "wait for any key" pause the typing bar/prompt is hidden, so a
  // command sent from the sidebar wouldn't reach the game as expected.
  // Disable the sidebar's command buttons for the duration of the pause and
  // restore them once the keypress is satisfied.
  function disableCommandButtonsDuringKeypress() {
    const commandControls = document.querySelectorAll(".dpad-btn, .command-link");
    const commandButtons = document.querySelectorAll(".game-command-btn");

    vorple.addEventListener("expectKeypress", function () {
      commandControls.forEach(el => el.classList.add("key-wait-disabled"));
      commandButtons.forEach(btn => btn.disabled = true);
    });

    vorple.addEventListener("submitKeypress", function () {
      commandControls.forEach(el => el.classList.remove("key-wait-disabled"));
      commandButtons.forEach(btn => btn.disabled = false);
    });
  }

  vorple.addEventListener("init", disableCommandButtonsDuringKeypress);

function updateDirectionButtons(availableDirections) {
  const available = new Set(
    availableDirections.split(",").map(d => d.trim().toUpperCase()).filter(Boolean)
  );
  document.querySelectorAll(".dpad-btn[data-command]").forEach(btn => {
    btn.classList.toggle("disabled", !available.has(btn.dataset.command.toUpperCase()));
  });
}

function toggleAccordion(button) {
  const content = button.nextElementSibling;

  // Close all others
  document.querySelectorAll(".accordion-content").forEach(c => {
    if (c !== content) {
      c.classList.remove("open");
    }
  });

  // Toggle the clicked one
  content.classList.toggle("open");
}
