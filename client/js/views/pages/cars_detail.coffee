###
    View logic for the Cars detail page
###

Meteor.startup ->

    # Here's how you might clear the temporary description when the page is opened again
    Template.carsDetail.created = ->
        Session.set('carsDetailDescription', '')

    getId = ->
        templateData = Session.get('templateData')
        return if templateData then templateData.id else ''

    Template.carsDetail.events =
        # Prevent the page reloading for links
        "click a": (e) ->
            App.router.aReplace(e)

        'submit .form-description': (event, template) ->
            event.preventDefault()
            description = Session.get('carsDetailDescription')
            Cars.update({_id: getId()}, {$set: {description: description}});

        'input .description': (event, template) ->
            Session.set('carsDetailDescription', event.target.value)

    Template.carsDetail.helpers
        car: ->
            return Cars.findOne({_id: getId()})
        descriptionPending: ->
            return Session.get('carsDetailDescription');
