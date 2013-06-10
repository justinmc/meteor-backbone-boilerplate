###
    View logic for the Cars detail page
###

@ViewCarsDetail = Backbone.View.extend

    # The Meteor template used by this view
    template: null

    # Called on creation
    initialize: (id) ->
        # Use Meteor.render to set our template reactively
        this.template = Meteor.render () ->
            return Template.cars_detail({car: Cars.findOne({_id: id})})
    
    # Render the view on its $el paramter and return the view itself
    render: () ->
        this.$el = (this.template)
        return this

