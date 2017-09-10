class window.Column extends Backbone.Model
  defaults:
    name: 'New Column'

  parse: (data)->
    # shallow copy raw JSON data but omit 'cardIds' property
    # 'data' is an object representing a column
    attrs = _.omit data, 'cardIds'
    # if the column instance has no 'cards' property create a CardCollection
    # assign the CardCollection instance to the column instance's 'cards' property
    # collect cards that belong to 'data'
    # Model#get() is a Backbone.js method
    attrs.cards = @get('cards') ? new window.CardCollection
    attrs.cards.reset(
      for cardId in data.cardIds or []
        window.allCards.get(cardId)
      )

    attrs

  # I suspect that @attributes collects all the instance properties
  # while leaving out all instance methods
  toJSON: ->
    data = _.omit @attributes, 'cards'
    # take only 'id'
    data.cardIds = @get('cards').pluck 'id'

    data

class window.ColumnCollection extends Backbone.Collection
  model: Column

columnData = JSON.parse(localStorage.columns)
window.allColumns = new ColumnCollection(columnData, {parse: true})

class window.ColumnView extends Backbone.View
  initialize: (options)->
    @cardViews = []
    # listen to card add or remove events
    # but how to remove a card?
    @listenTo @model.get('cards'), 'add remove', =>
      @model.save()
      @render()
    super

  render: ->
    html = JST['templates/column']
      name: @model.get('name')
      cards: @model.get('cards').toJSON()

    @$el.html html

    @cardViews = @model.get('cards').map (card)=>
      cardView = new window.CardView(model: card)
      cardView.setElement @$("[data-card-id=#{card.get('id')}]")
      cardView.render()
      cardView
    @

  events:
    'change [name=column-name]': 'nameChangeHandler'
    'click [name=add-card]': 'addCardClickHandler'

  nameChangeHandler: (e)->
    @model.save 'name', $(e.currentTarget).val()
    return

  addCardClickHandler: (e)->
    newCard = new window.Card({}, {parse: true})
    newCard.save()
    @model.get('cards').add(newCard)
    return
