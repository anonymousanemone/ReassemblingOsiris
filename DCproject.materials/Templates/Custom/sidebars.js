function toggleHelp(show) {
    document.getElementById('helpPopup').style.display = show ? 'flex' : 'none';
    document.getElementById('overlay').style.display = show ? 'block' : 'none';
  }

  function switchTab(tabName) {
    document.querySelectorAll('.tab-button').forEach(btn => {
      btn.classList.remove('active');
    });
    document.querySelectorAll('.help-content').forEach(tab => {
      tab.classList.remove('active');
    });
    document.querySelector(`.tab-button[onclick="switchTab('${tabName}')"]`).classList.add('active');
    document.getElementById(`tab-${tabName}`).classList.add('active');
  }

  function insertCommand(command) {
    const input = document.querySelector('input[type="text"]');
    if (input) {
      input.value = command + ' ';
      input.focus();
    }
  }