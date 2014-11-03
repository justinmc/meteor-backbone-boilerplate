###
    View logic for the header component
###

Meteor.startup () ->

    Template.componentHeader.events
        # Prevent the page reloading for links
        "click a": (e) ->
            App.router.aReplace(e)

    # Is the user logged in?
    loggedIn = Meteor.userId()?

    Template.componentHeader.helpers
        loggedIn: loggedIn
        name: ->
            # Get parameters for the user if logged in
            if loggedIn && Meteor.user()? && Meteor.user().profile?
                return Meteor.user().profile.name
            else
                return ''
