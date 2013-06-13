###
    View logic for the Cars page
###

@ViewCars = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    # Called on creation
    initialize: () ->
        Template.cars.events =
            # Prevent the page reloading for links
            "click a": (e) ->
                App.router.aReplace(e)

        # Use Meteor.render to set our template reactively
        @template = Meteor.render () ->
            html = Template.cars({cars: Cars.find({}, {sort: {coolness: "desc"}})})
            return html
    
    # Render the view on its $el paramter and return the view itself
    render: () ->
        @$el = (@template)
        return this

