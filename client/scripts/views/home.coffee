###
    View logic for the home page
###

@Home = Backbone.View.extend

    # The Meteor template used by this view
    template: Template.home()

    # Render the view on its $el paramter and return the view itself
    render: () ->
        this.$el.html(this.template)
        return this

