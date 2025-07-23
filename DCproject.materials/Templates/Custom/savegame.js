let lastWrite = false;
let lastRestore = false;

function saveGame() {
  vorple.prompt.queueCommand('SAVE')
  const originalWrite = vorple.file.write;
  vorple.file.write = function (filename, contents, options) {
      const isRelevantFile = filename.startsWith(vorple.file.ASYNC_FS_ROOT);
      const hasContent = (
        (typeof contents === "string" && contents.length > 0) ||
        (contents instanceof Uint8Array && contents.length > 0) ||
        (Array.isArray(contents) && contents.length > 0)
      );

      if (isRelevantFile && hasContent) {
        console.log("[write intercepted]");
        console.log("Filename:", filename);
        console.log("Contents (preview):", typeof contents === "string" ? contents.slice(0, 100) : contents);
        // console.log("Options:", options);
      }

      const result = originalWrite(filename, contents, options);

      if (filename.startsWith(vorple.file.ASYNC_FS_ROOT)) {
        if (result === true) {
          console.log("Write result:", result);
          lastWrite = true;
        }
      }
    return result;
  }
}

function changeSave(){
  if (!lastWrite) return;
  const spans = Array.from(document.querySelectorAll('div.turn > span'));
  // console.log(spans);
  const matchingSpans = spans.filter(span => span.textContent.trim()=== 'Save failed.');
  // console.log(matchingSpans);
  const lastMatchingSpan = matchingSpans[matchingSpans.length - 1];
  // console.log(lastMatchingSpan);
  lastMatchingSpan.textContent = "Ok. \n";
  lastWrite = false;
}

vorple.addEventListener( 'expectCommand', changeSave );

function restoreGame() {
  vorple.prompt.queueCommand('RESTORE');
  lastRestore = true;
}

function clearScreen(){
  if (!lastRestore) return;
  const outputArea = document.getElementById("vorple");
  const turn = outputArea.querySelector(".turn.previous");
  // console.log(turn);
  if (!turn) return;

  const input = turn.querySelector(".lineinput.last");
  const spans = turn.querySelectorAll("span");

  const inputText = input?.textContent?.trim().toLowerCase();
  const spanTexts = Array.from(spans).map(span => span.textContent.trim().toLowerCase());
  console.log(inputText)
  console.log(spanTexts)

  if (inputText.includes("restore") && spanTexts.includes("ok.")) {
    console.log("Restore confirmed, queuing follow-up command...");
    setTimeout(() => {
      vorple.prompt.queueCommand('clear-the-screen-exec-command');
    }, 500);
    lastRestore = false;
  }
  
}

vorple.addEventListener( 'expectCommand', clearScreen );

function loadGameFromFile() {
}

function saveTranscript() {
  vorple.prompt.queueCommand('TRANSCRIPT')
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

async function getVorpleSaveFiles() {
  console.log("accessed");
  const fs = vorple.file.getFS();
  const fullPath = vorple.file.path(gameid, vorple.file.SAVEFILE_PATH);

  if (!fs) {
    console.warn("Filesystem not available");
    return [];
  }

  return new Promise(resolve => {
    fs.readdir(fullPath, (err, result) => {
      if (err) {
        console.error("Error reading savefile directory:", err);
        resolve([]);
      } else {
        resolve(result || []);
      }
    });
  });
}


function checkFiles(){
  getVorpleSaveFiles(gameId).then(savefiles => {
    console.log("Available save files:", savefiles);
    if (savefiles.length === 0) {
      alert("No save files found.");
    } else {
      // Do something with the list, like populate a custom dialog
      savefiles.forEach(file => {
        console.log("Savefile:", file);
      });
    }
  });

}