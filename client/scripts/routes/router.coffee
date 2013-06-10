###
    Main router for the project
###

@Router = Backbone.Router.extend

    routes:
        "": "home"
        "colors": "colors"
        "cars": "cars"
        "cars/car/:id": "cars_car"
        "account": "account"
        "*path": "home" # For any other path, go home
    
    # Selector for the div that will contain each page
    page_parent_sel: "#content"

    # Selector for the container of the login component
    page_navbar_sel: "#navbar"

    # Constructor
    initialize: () ->
        # Create a component view that renders in the page template, on every page
        @viewNavbar = new ViewNavbar()
        $(@page_navbar_sel).append(@viewNavbar.render().$el)

    # Actually changes the page by creating the view and inserting it
    go: (viewClass, internal, params) ->
        if !viewClass?
            viewClass = Home
     
        # Pages that are "internal" can only be viewed by a logged in user
        me = @
        Deps.autorun () ->
            # If a user tries to visit an internal page, redirect to home
            if internal? and !Meteor.userId()?
                me.go Home
                return
        
        # If all is well, go to the requested page!
        if !internal or Meteor.userId()?
            view = new viewClass(params)
            $(@page_parent_sel).html(view.render().$el)

    # Methods for each route
    home: () ->
        @.go Home

    colors: () ->
        @.go ViewColors

    cars: () ->
        @.go ViewCars

    cars_car: (id) ->
        @.go ViewCarsDetail, false, id

    account: () ->
        @go ViewAccount, true


