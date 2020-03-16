navigator.serviceWorker && navigator.serviceWorker.register('./service_worker.js').then(function(registration) {
  console.log('[Service worker] registered with scope: ', registration.scope);
});