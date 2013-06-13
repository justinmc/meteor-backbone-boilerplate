###
    View logic for the header component
###

@ViewHeader = Backbone.View.extend

    template: null

    # Attributes for rendering the root element
    tagName: "div"
    id: "header"

    initialize: () ->
        me = @

        Template.componentHeader.events =
            # Prevent the page reloading for links
            "click a": (e) ->
                App.router.aReplace(e)
            
        @template = Meteor.render () ->
            # Is the user logged in?
            loggedIn = Meteor.userId()?

            # Get parameters for the user if logged in
            if loggedIn && Meteor.user()? && Meteor.user().profile?
                name = Meteor.user().profile.name

            return Template.componentHeader({loggedIn: loggedIn, name: name})

    # Render the view on its $el paramter and return the view itself
    render: () ->
        @$el.html(@template)
        return this

