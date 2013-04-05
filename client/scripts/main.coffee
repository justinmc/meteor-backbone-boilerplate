###
    The main entry point for the client side of the app
###

# Create the main app object
@App = {}

# Create the needed collections on the client side
@Colors = new Meteor.Collection("colors")
@Cars = new Meteor.Collection("cars")

Meteor.startup () ->
    # Create the backbone router
    App.router = new Router()
    Backbone.history.start({pushState: true})

