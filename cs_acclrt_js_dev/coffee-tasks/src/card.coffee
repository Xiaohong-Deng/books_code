class window.Card extends Backbone.Model

class window.CardCollection extends Backbone.Collection
  model: Card

# JSON.parse is a javascript function
cardData = JSON.parse(localStorage.cards)
window.allCards = new CardCollection(cardData, {parse: true})

class window.CardView extends Backbone.View
  render: ->
    html = JST['templates/card']
      description: @model.get('description')
      dueDate: @model.get('due-date')

    @$el.html html
    @

  # listen to event on selector, if the value between the tag changes
  # fire up the handler
  events: # object or hash map containg key-value pairs
    'change [name=card-description]': 'descriptionChangeHandler'
    'change [name=due-date]': 'dueDateChangeHandler'

  descriptionChangeHandler: (e)->
    # save changes both model and server side database
    @model.save 'description', $(e.currentTarget).val()
    return

  dueDateChangeHandler: (e)->
    @model.save 'due-date', $(e.currentTarget).val()
    return
