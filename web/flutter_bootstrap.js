// The entry point for the web app.
// This file is required to make the app run in a browser.

// This is a placeholder for the Flutter web bootstrap script
// It will be replaced by the real Flutter web bootstrap script when the app is built
// In debug mode, this script is used to load the Flutter web app in the browser
// and connect to the Dart DevTools for debugging

// Initialize service worker
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function () {
    navigator.serviceWorker.register('flutter_service_worker.js');
  });
}

// Bootstrap Flutter web
window.addEventListener('load', function () {
  // Download main.dart.js
  var scriptTag = document.createElement('script');
  scriptTag.src = 'main.dart.js';
  scriptTag.type = 'application/javascript';
  document.body.appendChild(scriptTag);
});