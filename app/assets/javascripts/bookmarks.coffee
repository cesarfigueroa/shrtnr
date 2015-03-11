class Bookmarks
  constructor: (@config) ->
    @setup()
    @bindEvents()

  # fieldTypes: [
  #   'fieldset'
  #   'submit'
  #   'reset'
  #   'button'
  #   'file'
  #   'radio'
  #   'checkbox'
  # ]

  setup: ->
    # @request = new XMLHttpRequest
    @config.form.setAttribute('novalidate', 'novalidate')

  bindEvents: ->
    @config.form.addEventListener 'submit', (event) =>
      event.preventDefault()
      @addBookmark()

    # @request.addEventListener 'load', (event) =>
    #   data = JSON.parse(event.target.responseText)
    #   @addItem(@toHTML(@template(@config.template.innerHTML, data)))
    #   @resetForm()

    # @request.addEventListener 'readystatechange', (event) =>
    #   if @request.readyState == 4 and @request.status == 200
    #     @addItem(@toHTML(@template(@config.template.innerHTML, JSON.parse(event.target.responseText))))
    #     @resetForm()

  addBookmark: ->
    if @config.form.checkValidity()
      @disableForm()
      @createRecord()
      @removeNotice()

  createRecord: ->
    formData = new FormData(@config.form)
    @fetchURL('POST', @config.form.action, formData)

  # displayError: (message) ->
  #   p = document.createElement('p')
  #   p.style.backgroundColor = 'red'
  #   p.style.color = 'white'
  #   p.textContent = message
  #
  #   document.body.insertBefore(p, document.body.firstElementChild)

  fetchURL: (method, url, data) ->
    request = new XMLHttpRequest
    request.open(method, url, true)
    request.setRequestHeader('Accept', 'application/json')
    request.send(data)

    request.onload = =>
      # data = JSON.parse(event.target.responseText)
      # @addItem(@toHTML(@template(@config.template.innerHTML, data)))
      # @resetForm()
      @addItem(@toHTML(@template(@config.template.innerHTML, JSON.parse(request.responseText))))
      @resetForm()

  addItem: (item) ->
    @config.list.insertBefore(item, @config.list.firstElementChild)

  disableForm: ->
    # Also disable inputs
    @config.submitButton.setAttribute('disabled', true) # form.submitButton!

  resetForm: ->
    @config.form.reset()
    @config.submitButton.removeAttribute('disabled')

  toHTML: (string) ->
    parser = new DOMParser
    parser.parseFromString(string, @config.template.type).body.firstElementChild

  removeNotice: -> # rename to 'removePlaceholder'
    if document.contains(@config.notice)
      @config.notice.parentNode.removeChild(@config.notice)

  template: (view, data) ->
    view.replace /{{\s?(\w+)\s?}}/g, (_, match) ->
      data[match]

new Bookmarks
  form: document.querySelector('#js-bookmarks-form')
  submitButton: document.querySelector('#js-bookmarks-form-submit-button')
  list: document.querySelector('#js-bookmarks-list')
  template: document.querySelector('#js-bookmark-template')
  notice: document.querySelector('#js-bookmarks-notice')
