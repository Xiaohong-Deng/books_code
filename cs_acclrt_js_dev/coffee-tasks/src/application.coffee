Backbone.sync = (method, model, options)->
  if model instanceof window.Card
    collection = window.allCards
    localStorageKey = 'cards'
  else if model instanceof window.Column
    collection = window.allColumns
    localStorageKey = 'columns'
  else if model instanceof window.Board
    collection = window.allBoards
    localStorageKey = 'boards'

  switch method
    when 'get' # cuz this is mimic the server side storage, so get is like update local data
      model.reset collection.get(model.id), {silent: true}
    when 'create' # new data with everything but 'id' set
      model.set 'id', collection.length + 1
      collection.add(model)
      localStorage[localStorageKey] = JSON.stringify collection.toJSON()
    when 'update'
      localStorage[localStorageKey] = JSON.stringify collection.toJSON()

xhr = options.xhr = jQuery.Deferred().resolve(model.toJSON()).promise()
options.success(model.toJSON())
xhr

$ ->
  board = window.allBoards.last()
  $board = $("<div class='board' data-board-id='#{board.get('id')}'></div>")
  $('body').append $board
  boardView = new window.BoardView(
    model: board
    el: $board
    ).render()
  return
