(function () {
  if (window.location.hostname !== 'localhost') {
    var url = 'http://shrtnr.dev/bookmarks/add'

    var params = {
      title: document.title,
      url: window.location.href
    };

    var query = Object.keys(params).map(function (key) {
      return 'bookmark[' + key + ']=' + encodeURIComponent(params[key]);
    }).join('&')

    var request = new XMLHttpRequest;
    request.open('GET', [url, query].join('?'), true);
    request.send();

    request.onload = function () {
      console.log('Added!');
    };
  }
})();
