###
    View logic for the Account page
###

@ViewAccount = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    # Called on creation
    initialize: () ->
        # Use Meteor.render to set our template reactively
        @template = Meteor.render () ->
            email = Meteor.users.getActiveEmail()

            if Meteor.user()? && Meteor.user().profile?
                name = Meteor.user().profile.name

            return Template.account(user_id: Meteor.userId(), email: email, name: name)
    
    # Render the view on its $el paramter and return the view itself
    render: () ->
        @$el = (this.template)
        return this

