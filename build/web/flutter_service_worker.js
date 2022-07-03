'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "3ae5cde954417ac1a8fb8cec6e56d249",
"assets/assets/markdown/%25E4%25B8%25AA%25E4%25BA%25BA%25E9%25A1%25B9%25E7%259B%25AE%25E6%2580%25BB%25E7%25BB%2593.md": "a5f3e96a108dad0e68634cb2a74a657e",
"assets/assets/markdown/%25E4%25BB%25A3%25E7%25A0%2581%25E9%2580%259F%25E6%259F%25A5.md": "5dcfbd128a4bbf6fc8f7fbfaa9ef6660",
"assets/assets/markdown/%25E4%25BD%25BF%25E7%2594%25A8dart%25E7%25BC%2596%25E5%2586%2599%25E8%25B7%25A8%25E5%25B9%25B3%25E5%258F%25B0%25E5%2591%25BD%25E4%25BB%25A4%25E8%25A1%258C%25E5%25B7%25A5%25E5%2585%25B7.md": "d7998da97b03f35c7924cbe1df7e8c60",
"assets/assets/markdown/%25E5%258D%259A%25E5%25AE%25A2%25E5%2588%259B%25E5%25BB%25BA%25E7%259A%2584%25E5%258A%25A8%25E6%259C%25BA.md": "ef761fb7ae5deea487a0d85eca88ffc3",
"assets/assets/markdown/%25E5%258D%259A%25E5%25AE%25A2%25E7%25B3%25BB%25E7%25BB%259F%25E6%2597%25A5%25E5%25BF%2597.md": "a68f141a6e490071ee158a99935852ac",
"assets/assets/markdown/%25E5%259F%25BA%25E7%25A1%2580%25E7%259F%25A5%25E8%25AF%2586/%25E8%258C%2583%25E6%2595%25B0.md": "c6f0bea25139914b1217696d7f28b21e",
"assets/assets/markdown/%25E5%259F%25BA%25E7%25A1%2580%25E7%259F%25A5%25E8%25AF%2586/argparser.md": "7f4a752386877cf71ab89327f3c9576e",
"assets/assets/markdown/%25E5%259F%25BA%25E7%25A1%2580%25E7%259F%25A5%25E8%25AF%2586/DL%25E5%259F%25BA%25E7%25A1%2580%25E8%25A7%2586%25E9%25A2%2591%25E5%25AD%25A6%25E4%25B9%25A0%25E6%2595%2599%25E7%25A8%258B.md": "d1bda3275ef0411725f01a0e90fd6ef3",
"assets/assets/markdown/%25E5%259F%25BA%25E7%25A1%2580%25E7%259F%25A5%25E8%25AF%2586/Latex%25E7%25AC%2594%25E8%25AE%25B0.md": "7c2d0fcf172688eb30399776501e7046",
"assets/assets/markdown/%25E5%25AE%259E%25E4%25B9%25A0/NLP%25E5%259F%25BA%25E7%25A1%2580%25E7%259F%25A5%25E8%25AF%2586.md": "5d9c45177ae3838e76f32ea0d7ce50ae",
"assets/assets/markdown/%25E5%25AE%259E%25E4%25B9%25A0/NLP%25E5%25AE%259E%25E4%25B9%25A0%25E9%259D%25A2%25E7%25BB%258F%25E6%2594%25B6%25E9%259B%2586.md": "b2ef9769393245b1feee91a2afc3ca53",
"assets/assets/markdown/%25E5%25AE%259E%25E7%2594%25A8%25E5%25B7%25A5%25E5%2585%25B7%25E6%2594%25B6%25E9%259B%2586.md": "9be72a131baee21ebea17996d780f3bd",
"assets/assets/markdown/%25E6%2591%25B8%25E9%25B1%25BC%25E6%25B8%25B8%25E6%2588%258F%25E5%2590%2588%25E9%259B%2586.md": "f12a16f80d73a7c2e19c1a88e905479c",
"assets/assets/markdown/%25E6%2597%25A0%25E7%259B%2591%25E7%259D%25A3%25E5%25AD%25A6%25E4%25B9%25A0%25E6%2596%25B9%25E6%25B3%2595%25E5%2592%258C%25E6%25A8%25A1%25E5%259E%258B.md": "0a54464ab4604075ace0ec860a55f1a1",
"assets/assets/markdown/%25E6%259C%25BA%25E5%2599%25A8%25E5%25AD%25A6%25E4%25B9%25A0%25E8%25B7%25AF%25E7%25BA%25BF.md": "81c1adf576489fd8de29850456ab6ef3",
"assets/assets/markdown/%25E6%25A6%2582%25E5%25BF%25B5%25E9%2580%259F%25E6%259F%25A5.md": "f4ab5b0bce05ecd822b44b367644ed6d",
"assets/assets/markdown/%25E6%25B7%25B1%25E5%25BA%25A6%25E5%25AD%25A6%25E4%25B9%25A0%25E5%25B7%25A5%25E5%2585%25B7%25E7%25BD%2591%25E7%25AB%2599.md": "f9a1fe8180ef7d2632e8921fa65d5508",
"assets/assets/markdown/%25E6%25B7%25B1%25E5%25BA%25A6%25E5%25AD%25A6%25E4%25B9%25A0-%25E5%25AD%25A6%25E4%25B9%25A0%25E8%25B5%2584%25E6%2596%2599.md": "e1985a55a2c7f200143d71f6d48ae1d1",
"assets/assets/markdown/%25E8%25AE%25BA%25E6%2596%2587%25E9%2598%2585%25E8%25AF%25BB%25E6%258A%2580%25E5%25B7%25A7.md": "e732a5c432e81e680370c1476e07f96f",
"assets/assets/markdown/%25E8%25AF%25BE%25E7%25A8%258B%25E8%25AE%25BE%25E8%25AE%25A1%25E7%259B%25B8%25E5%2585%25B3.md": "420800bfb21fbe2e5fea46e396c07433",
"assets/assets/markdown/%25E9%2585%258D%25E7%258E%25AF%25E5%25A2%2583/%25E4%25B8%2580%25E6%25AC%25A1%25E6%2580%25A7%25E8%25A7%25A3%25E5%2586%25B3cmd%25E7%25BD%2591%25E7%25BB%259C%25E9%2597%25AE%25E9%25A2%2598.md": "702c9070a72da82178015a9631e873d2",
"assets/assets/markdown/%25E9%2585%258D%25E7%258E%25AF%25E5%25A2%2583/conda%25E7%258E%25AF%25E5%25A2%2583.md": "3cb086cdbd8ae807a079173f3217d678",
"assets/assets/markdown/%25E9%2585%258D%25E7%258E%25AF%25E5%25A2%2583/docker%25E5%2585%25A5%25E9%2597%25A8.md": "adda72fcf3db825adf4009ee10caa464",
"assets/assets/markdown/%25E9%2585%258D%25E7%258E%25AF%25E5%25A2%2583/pytorch%2520pth%25E8%25BD%25ACtflite.md": "93c164d3fc449b4f8394f6b4d492489c",
"assets/assets/markdown/A%2520Deep%2520Cluster%2520Survey.md": "b2f0c6480e37603b4fa8aa3ad7c8e408",
"assets/assets/markdown/apt%25E5%25AE%2589%25E8%25A3%2585%25E6%258C%2587%25E5%25AE%259A%25E7%2589%2588%25E6%259C%25AC.md": "6b398e796b4a5b8f36e509863fcd9024",
"assets/assets/markdown/batch%2520norm%25E7%2594%25A8%25E5%25A4%2584.md": "e3284694e8215fe40229b6ffd4501e59",
"assets/assets/markdown/BERT-GAN.md": "53eaf3e311a3f1de26c35673c1ce1ff4",
"assets/assets/markdown/colab%2520ipynb%25E4%25B8%2580%25E9%2594%25AE%25E7%2594%259F%25E6%2588%2590pdf.md": "84546c8d41659997d68d17ec7c669ee5",
"assets/assets/markdown/csdn/%25E6%2588%2591%25E7%259A%2584%25E8%2587%25AA%25E7%2594%25A8%25E7%25AC%2594%25E8%25AE%25B0%25E7%25B3%25BB%25E7%25BB%259F.md": "689ed2728330947fd2d8ff3e058d49bd",
"assets/assets/markdown/csdn/%25E6%259F%25A5%25E8%25AF%25A2%25E8%2587%25B3%25E5%25B0%2591%25E9%2580%2589%25E4%25BA%25861%25E7%258F%25AD2%25E5%258F%25B7%25E5%2590%258C%25E5%25AD%25A6%25E6%2589%2580%25E9%2580%2589%25E8%25AF%25BE%25E7%259A%2584%25E6%2589%2580%25E6%259C%2589%25E5%2590%258C%25E5%25AD%25A6%25E7%258F%25AD%25E5%258F%25B7%25E3%2580%2581%25E5%25AD%25A6%25E5%258F%25B7.md": "a3abb1d1ad3410fed7b9f25f0d7878ac",
"assets/assets/markdown/csdn/dart-js%25E6%25B7%25B7%25E7%2594%25A8%25E6%2596%25B9%25E6%25B3%2595.md": "d0ba18bf5697a0a904566404c2a846a0",
"assets/assets/markdown/csdn/Python%2520trick_recipe%2520&%2520features.md": "3a66854f83bbc412d3d6f904a94c7cbb",
"assets/assets/markdown/csdn/Python%2520_args%25E5%2592%258C__kwargs.md": "346ff1249076355760c4f4357478bbbd",
"assets/assets/markdown/csdn/Python%25E5%2592%258CPycharm%25E3%2580%2581Vscode%25E4%25BD%25BF%25E7%2594%25A8%25E6%258A%2580%25E5%25B7%25A7.md": "7550a4d0f492620a249863362f3762dd",
"assets/assets/markdown/csdn/Theano%25E5%2585%25A5%25E9%2597%25A8%25E5%25AD%25A6%25E4%25B9%25A0.md": "6eb79dc1f1fb8698f4a6cfc7174878e5",
"assets/assets/markdown/csdn/ubuntu%2520proxychains%2520%25E9%2585%258D%25E7%25BD%25AE.md": "21d1e33d5e9e505b677a6ca659e28b4c",
"assets/assets/markdown/csdn/Unity%2520WebGL%25E6%2589%2593%25E5%258C%2585%25E5%2590%258E%25E7%259A%2584%25E9%25BC%25A0%25E6%25A0%2587%25E5%2581%258F%25E7%25A7%25BB%25E9%2597%25AE%25E9%25A2%2598.md": "eb1af230d539d4e13c0b877d4c5b5338",
"assets/assets/markdown/DL/%25E5%25B0%259D%25E8%25AF%2595%25E5%2586%2599%25E4%25B8%2580%25E4%25B8%25AA%25E7%259F%25A9%25E9%2598%25B5%25E7%25BA%25A7%25E4%25BB%25A3%25E7%25A0%2581.md": "a162ee17ae99b89fec23e5490307db5f",
"assets/assets/markdown/DL/GNN.md": "128c0b6111f944ca682139e8deb886b4",
"assets/assets/markdown/DL/MindmapProject.md": "d7d2e0d6e7c50031118eab2efc7f849b",
"assets/assets/markdown/DL/nlp%25E5%25B7%25A5%25E5%2585%25B7.md": "7f2eaa679e09d20aec15628f7daba125",
"assets/assets/markdown/DL/Python%2520Hook.md": "e587fc3edb46b9cd34a4e339a165e84c",
"assets/assets/markdown/DL/TF-gpu%25E9%2585%258D%25E7%25BD%25AE.md": "08e9b5fe53597c9aa5a621e1d66b06c1",
"assets/assets/markdown/DL/Time%2520Series%2520forcasting.md": "62e910ba1f155ac78bb1b9d2f4440bbb",
"assets/assets/markdown/Flutter%25E7%25AC%2594%25E8%25AE%25B0.md": "df99e4d2badad3b0b4a25e2a1b9e1cf6",
"assets/assets/markdown/gene%25E5%2585%25A5%25E9%2597%25A8.md": "c6df9ff0a2db57e0d4d0188c4337003c",
"assets/assets/markdown/github%2520pages%2520%25E5%2585%258D%25E6%259C%258D%25E5%258A%25A1%25E5%2599%25A8%25E5%25AE%259E%25E7%258E%25B0%25E8%25AF%2584%25E8%25AE%25BA%25E5%258A%259F%25E8%2583%25BD.md": "8e0882724685a338b1c7b858239b53a2",
"assets/assets/markdown/kaggle%2520%25E5%2585%25A5%25E9%2597%25A8%25E6%2580%25BB%25E7%25BB%2593.md": "08cd3cad12a1ff6e6b5559d4447beb3d",
"assets/assets/markdown/lb%25E7%25AC%25AC%25E4%25BA%258C%25E5%25AD%25A3op.md": "da90da09bf02c63c713ab9546da7bbc8",
"assets/assets/markdown/leetcode/leetcode%25E7%25AC%2594%25E8%25AE%25B0_2%25E6%259C%2588.md": "93b6b0ee5a5d52945280cf6c7f4a9f0c",
"assets/assets/markdown/nlp%25E8%25B7%25AF%25E7%25BA%25BF.md": "92ea3c3f561fc0061560b2c158b50146",
"assets/assets/markdown/pytorch%2520cuda%25E9%2585%258D%25E7%25BD%25AE.md": "dfa51e438a96ab0c072e77de492720fc",
"assets/assets/markdown/pytorch%25E4%25BB%25A3%25E7%25A0%2581%25E7%25BC%2596%25E5%2586%2599.md": "df8a267bb04e59ba80b95e6b20c2c3e8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "2fbc6de71fe30e6db710087ab152944b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "94ea3e8f2293f94f7897d85906130578",
"/": "94ea3e8f2293f94f7897d85906130578",
"lib/canvaskit.js": "0d5408edb62a8f95d9a00835027cbb9a",
"lib/canvaskit.wasm": "94da52ff225af2ee7b498ca694692a1f",
"main.dart.js": "88e6a5991e7a61800e0ba8fcf77dacaf",
"manifest.json": "41775d965c3da9bfc40de340b46edf01",
"version.json": "375febd5e612f8c71611f45e2e9e459a"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
