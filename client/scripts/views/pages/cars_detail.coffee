###
    View logic for the Cars detail page
###

@ViewCarsDetail = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    # Called on creation
    initialize: (id) ->
        Template.cars_detail.events =
            # Prevent the page reloading for links
            "click a": (e) ->
                App.router.aReplace(e)

        # Use Meteor.render to set our template reactively
        @template = Meteor.render () ->
            return Template.cars_detail({car: Cars.findOne({_id: id})})
    
    # Render the view on its $el paramter and return the view itself
    render: () ->
        @$el = (@template)
        return this

