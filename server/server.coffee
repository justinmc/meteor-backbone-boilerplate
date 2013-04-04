# Create the collections on the server side
Colors = new Meteor.Collection("colors")
Cars = new Meteor.Collection("cars")

Meteor.startup () ->
    # Fill the colletions with some initial data if they're empty
    if Colors.find().count() == 0
        Colors.insert({name: "red"})
        Colors.insert({name: "blue"})

    if Cars.find().count() == 0
        Cars.insert({make: "Volkswagen", model: "Beetle", description: "A very dome shaped car", coolness: 1})
        Cars.insert({make: "Chevrolet", model: "Volt", description: "An electric car!", coolness: 2})

