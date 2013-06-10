###
    The colors collection
###

# Declare the collection
Colors = new Meteor.Collection("colors")

# Publish the collection to the client
Meteor.publish "colors", () ->
    return Colors.find()

# Set permissions on this collection
Colors.deny
    # Records can't be deleted or edited
    remove: (userId, doc) ->
        return false
    update: (userId, doc) ->
        return false
Colors.allow
    # Client can add records
    insert: (userId, doc) ->
        return true

# What to do when the server first starts up
Meteor.startup () ->
    # Fill the collection with some initial data if it's empty
    if Colors.find().count() == 0
        Colors.insert({name: "red"})
        Colors.insert({name: "blue"})
