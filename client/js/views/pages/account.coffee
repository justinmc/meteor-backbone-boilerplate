###
    View logic for the Account page
###

Meteor.startup ->

    Session.setDefault('accountName', '')

    Template.account.events
        'submit .form-name': (event, template) ->
            event.preventDefault()
            name = Session.get('accountName')
            Meteor.users.update({_id: Meteor.userId()}, {$set: {profile: {name: name}}});

        'input .name': (event, template) ->
            Session.set('accountName', event.target.value)

    Template.account.helpers
        userId: Meteor.userId
        email: Meteor.users.getActiveEmail
        namePending: ->
            return Session.get('accountName')
        name: ->
            if Meteor.user()? && Meteor.user().profile?
                return Meteor.user().profile.name
