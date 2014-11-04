###
    Cars Collection View
###

Meteor.startup ->

    Template.collectionCars.helpers
        cars: ->
            return Cars.find({}, {sort: {coolness: 'desc'}})
