###
    The cars collection
###

# Declare the collection
Cars = new Meteor.Collection("cars")

# Publish the collection to the client
Meteor.publish "cars", () ->
    return Cars.find()

# Set permissions on this collection
Cars.deny
    # Records can't be deleted
    remove: (userId, doc) ->
        return false
Cars.allow
    # Client can add records
    insert: (userId, doc) ->
        return true
    update: (userId, doc) ->
        return true

# What to do when the server first starts up
Meteor.startup () ->
    # Fill the collection with some initial data if it's empty
    if Cars.find().count() == 0
        Cars.insert({make: "Volkswagen", model: "Beetle", description: "A very dome shaped car", coolness: 1})
        Cars.insert({make: "Chevrolet", model: "Volt", description: "An electric car!", coolness: 2})
