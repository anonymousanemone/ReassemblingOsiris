let imageMap = {};
let rootPath = "";

fetch('scene_dict.json')
  .then(res => res.json())
  .then(data => {
    rootPath = data["root-path"] || "";
    delete data["root-path"];
    imageMap = data;
    observeStatusChange();
  })
  .catch(err => console.error("Failed to load scene_dict.json:", err));

vorple.addEventListener("init", observeStatusChange);

function observeStatusChange() {
  const sceneEl = document.querySelector(".status-text-left");
  const regionEl = document.querySelector(".status-line-right");
  const imgEl = document.getElementById("scene-graphic");

  if (!sceneEl || !regionEl || !imgEl) {
    console.warn("Required elements not found. Observer not started.");
    return;
  }

  let lastScene = sceneEl.textContent.trim();
  let lastRegion = regionEl.textContent.trim();

  const observer = new MutationObserver(() => {
    const currentScene = sceneEl.textContent.trim();
    const currentRegion = regionEl.textContent.trim();
    console.log("mutation observed");

    if (!currentScene || !currentRegion ||
        (currentScene === lastScene && currentRegion === lastRegion)) return;

    lastScene = currentScene;
    lastRegion = currentRegion;

    const regionScenes = imageMap[currentRegion];
    if (!regionScenes) {
      console.warn(`Region "${currentRegion}" not found.`);
      return;
    }

    const imagePath = regionScenes[currentScene];
    if (imagePath && typeof imagePath === "string" && imagePath.trim() !== "") {
      const fullPath = rootPath ? rootPath + imagePath : imagePath;
      imgEl.src = fullPath;
    } else {
      console.warn(`Scene "${currentScene}" not found in region "${currentRegion}" or image path is empty.`);
      // Do nothing; keep default image
    }
  });

  observer.observe(sceneEl, { childList: true, subtree: true });
  observer.observe(regionEl, { childList: true, subtree: true });
}
function preloadRegionImages(regionName) {
  const regionScenes = imageMap[regionName];
  if (!regionScenes) return;

  for (const scene in regionScenes) {
    const path = regionScenes[scene];
    if (path && path.trim() !== "") {
      const fullPath = rootPath ? rootPath + path : path;
      const img = new Image();
      img.src = fullPath;
      preloadedImages[fullPath] = img;
    }
  }
}

function clearPreloadedImages() {
  preloadedImages = {};
}