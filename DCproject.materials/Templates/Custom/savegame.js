let lastWrite = false;

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
  vorple.prompt.queueCommand('RESTORE')
}

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