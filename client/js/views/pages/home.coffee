###
    View logic for the home page
###

@Home = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    initialize: () ->
        Template.home.events =
            # Prevent the page reloading for links
            "click a": (e) ->
                App.router.aReplace(e)

        @template = Meteor.render () ->
            return Template.home()

    # Render the view on its $el paramter and return the view itself
    render: () ->
        @$el.html(@template)
        return this

