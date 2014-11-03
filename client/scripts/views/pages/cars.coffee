###
    View logic for the Cars page
###

Meteor.startup ->

    Session.setDefault('carsMake', '')
    Session.setDefault('carsModel', '')
    Session.setDefault('carsDescription', '')
    Session.setDefault('carsCoolness', null)

    Template.cars.events =
        # Prevent the page reloading for links
        "click a": (e) ->
            App.router.aReplace(e)

        'submit .form-car': (event, template) ->
            event.preventDefault()
            make = Session.get('carsMake')
            model = Session.get('carsModel')
            description = Session.get('carsDescription')
            coolness = Session.get('carsCoolness')
            Cars.insert({make: make, model: model, description: description, coolness: coolness});

        'input .make': (event, template) ->
            Session.set('carsMake', event.target.value)

        'input .model': (event, template) ->
            Session.set('carsModel', event.target.value)

        'input .description': (event, template) ->
            Session.set('carsDescription', event.target.value)

        'input .coolness': (event, template) ->
            Session.set('carsCoolness', event.target.value)

    Template.cars.helpers
        carPending: ->
            return {
                make: Session.get('carsMake')
                model: Session.get('carsModel')
                description: Session.get('carsDescription')
                coolness: Session.get('carsCoolness')
            }
