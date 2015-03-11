var Bookmarks = {
  initialize: function (config) {
    this.config = config;
    this.setup();
    this.bindEvents();
  },

  setup: function () {
    this.config.form.setAttribute('novalidate', 'novalidate');
  },

  bindEvents: function () {
    this.config.form.addEventListener('submit', function (event) {
      event.preventDefault();
      this.addBookmark();
    }.bind(this));
  },

  addBookmark: function () {
    if (this.config.form.checkValidity()) {
      this.disableForm();
      this.createRecord();
      this.removePlaceholder();
    }
  },

  createRecord: function () {
    var formData = new FormData(this.config.form);
    this.fetchURL('POST', this.config.form.action, formData);
  },

  fetchURL: function (method, url, data) {
    var request = new XMLHttpRequest;
    request.open(method, url, true);
    request.setRequestHeader('Accept', 'application/json');
    request.send(data);

    request.onload = function () {
      this.addItem(this.toHTML(this.template(this.config.template.innerHTML, JSON.parse(request.responseText))));
      this.resetForm();
    }.bind(this);
  },

  addItem: function (item) {
    this.config.list.insertBefore(item, this.config.list.firstElementChild);
  },

  disableForm: function () {
    this.config.submitButton.setAttribute('disabled', 'disabled');
  },

  resetForm: function () {
    this.config.form.reset();
    this.config.submitButton.removeAttribute('disabled');
  },

  toHTML: function (string) {
    var parser = new DOMParser;
    return parser.parseFromString(string, this.config.template.type).body.firstElementChild;
  },

  removePlaceholder: function () {
    if (document.contains(this.config.notice)) {
      this.config.notice.parentNode.removeChild(this.config.notice);
    }
  },

  template: function (view, data) {
    return view.replace(/{{\s?(\w+)\s?}}/g, function (_, match) {
      return data[match];
    });
  }
};

Bookmarks.initialize({
  form: document.querySelector('#js-bookmarks-form'),
  submitButton: document.querySelector('#js-bookmarks-form-submit-button'),
  list: document.querySelector('#js-bookmarks-list'),
  template: document.querySelector('#js-bookmark-template'),
  notice: document.querySelector('#js-bookmarks-notice')
});
