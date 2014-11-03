###
    View logic for the Colors page
###

Meteor.startup ->

    Session.setDefault('colorsColor', '')

    Template.colors.events
        'submit .form-color': (event, template) ->
            event.preventDefault()
            color = Session.get('colorsColor')
            Colors.insert({name: color});

        'input .color': (event, template) ->
            Session.set('colorsColor', event.target.value)

    Template.colors.helpers
        colors: ->
            return Colors.find()
        colorPending: ->
            return Session.get('colorsColor')
