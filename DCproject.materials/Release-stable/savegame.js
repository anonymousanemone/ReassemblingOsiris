BrowserFS.configure({ fs: "LocalStorage" }, function (err) {
  if (err) return console.error(err);
  window.fs = BrowserFS.BFSRequire('fs');
});

function saveGame() {
  const gameId = "[IFID]"; // Replace with your game's IFID or identifier

  // Call saveFilePrompt with a callback
  vorple.file.saveFilePrompt(gameId, function (filename) {
    if (filename !== null) {
      console.log("User selected filename:", filename);
      // Create download link using the filename
      // const url = URL.createObjectURL(blob);
      // const a = document.createElement("a");
      // a.href = url;
      // a.download = filename; // Use the user-provided filename
      // a.click();
      // URL.revokeObjectURL(url);
    } else {
      console.log("User canceled the filename prompt.");
    }
  });
}

function loadGame() {
  fs.readFile("/game_save.json", "utf8", (err, data) => {
    if (err) return console.error("Load error:", err);

    const gameState = JSON.parse(data);
    console.log("Game loaded:", gameState);
    // Replace with your game loading logic
  });
}

function loadGameFromFile() {
  const fileInput = document.getElementById("gameFileInput");
  const file = fileInput.files[0];
  if (!file) return alert("No file selected.");

  const reader = new FileReader();
  reader.onload = function (e) {
    try {
      const gameState = JSON.parse(e.target.result);
      console.log("Loaded from file:", gameState);
      // Replace with your game loading logic
    } catch (err) {
      console.error("File parse error:", err);
    }
  };
  reader.readAsText(file);
}

function saveTranscript() {
  const transcript = `Player entered the dungeon...\nFound a sword...\nFought a dragon...`;
  downloadFile(transcript, "transcript.txt", "text/plain");
}

function downloadFile(data, filename, type) {
  const blob = new Blob([data], { type });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

function listFilesRecursively(path, fs, list = []) {
  const stats = fs.statSync(path);
  if (stats.isFile()) {
    list.push(path);
  } else if (stats.isDirectory()) {
    const files = fs.readdirSync(path);
    files.forEach(file => {
      listFilesRecursively(path + "/" + file, fs, list);
    });
  }
  return list;
}

// Example usage:
const fs = BrowserFS.BFSRequire("fs");
const files = listFilesRecursively("/", fs);
console.log("Virtual FS files:", files);

console.log(vorple.file.ASYNC_FS_ROOT);