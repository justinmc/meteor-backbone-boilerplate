###
    View logic for the navbar component
###

@ViewNavbar = Backbone.View.extend

    template: null

    # Attributes for rendering the root element
    tagName: "ul"
    id: "navbar-list"

    initialize: () ->
        me = @
            
        @template = Meteor.render () ->
            # Is the user logged in?
            loggedIn = Meteor.userId()?

            # Get parameters for the user if logged in
            if loggedIn && Meteor.user()? && Meteor.user().profile?
                name = Meteor.user().profile.name

            return Template.componentNavbar({loggedIn: loggedIn, name: name})

    # Render the view on its $el paramter and return the view itself
    render: () ->
        this.$el.html(this.template)
        return this

