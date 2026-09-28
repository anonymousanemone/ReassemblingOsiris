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
    if (!isTouchDevice) return;
    let hintShown = false;
    let tapHandler = null;

    vorple.addEventListener("expectKeypress", function () {
      if (!hintShown && typeof toastr !== "undefined") {
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

  // Enables/disables every sidebar control that sends a command to the game
  function setCommandControlsEnabled(enabled) {
    document.querySelectorAll(".dpad-btn, .command-link").forEach(el => {
      el.classList.toggle("key-wait-disabled", !enabled);
    });
    document.querySelectorAll(".game-command-btn").forEach(btn => {
      btn.disabled = !enabled;
    });
  }

  // During a "wait for any key" pause the typing bar/prompt is hidden, so a
  // command sent from the sidebar wouldn't reach the game as expected.
  // Disable the sidebar's command buttons for the duration of the pause and
  // restore them once the keypress is satisfied.
  function disableCommandButtonsDuringKeypress() {
    vorple.addEventListener("expectKeypress", function () {
      setCommandControlsEnabled(false);
    });

    vorple.addEventListener("submitKeypress", function () {
      setCommandControlsEnabled(true);
    });
  }

  vorple.addEventListener("init", disableCommandButtonsDuringKeypress);

  // block queuing commands via sidebar buttons while prompt is hidden with 
  // "hide the prompt" commands within the inform file
  function disableCommandButtonsWhilePromptHidden() {
    const originalHide = vorple.prompt.hide;
    const originalUnhide = vorple.prompt.unhide;

    vorple.prompt.hide = function (...args) {
      setCommandControlsEnabled(false);
      return originalHide.apply(vorple.prompt, args);
    };

    vorple.prompt.unhide = function (...args) {
      setCommandControlsEnabled(true);
      return originalUnhide.apply(vorple.prompt, args);
    };
  }

  vorple.addEventListener("init", disableCommandButtonsWhilePromptHidden);

function updateDirectionButtons(availableDirections) {
  const available = new Set(
    availableDirections.split(",").map(d => d.trim().toUpperCase()).filter(Boolean)
  );
  document.querySelectorAll(".dpad-btn[data-command]:not(.compass-center)").forEach(btn => {
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
