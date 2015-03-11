var fsevents = require('fsevents');
var childProcess = require('child_process');

fsevents('app/assets').on('change', function (path, info) {
  childProcess.exec('npm run assets');
  console.log('Updated', info.path);
}).start();
