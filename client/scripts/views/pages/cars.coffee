###
    View logic for the Cars page
###

@ViewCars = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    # Called on creation
    initialize: () ->
        # Use Meteor.render to set our template reactively
        this.template = Meteor.render () ->
            html = Template.cars({cars: Cars.find({}, {sort: {coolness: "desc"}})})
            return html
    
    # Render the view on its $el paramter and return the view itself
    render: () ->
        this.$el = (this.template)
        return this

