###
    Main router for the project
###

Router = Backbone.Router.extend

    routes:
        "": "home"
        "colors": "colors"
        "cars": "cars"
        "cars/car/:id": "cars_car"
        "*path": "home" # For any other path, go home
    
    # Selector for the div that will contain each page
    page_parent_sel: "#content"

    # Actually changes the page by creating the view and inserting it
    go: (viewClass, params) ->
        if !viewClass?
            viewClass = Home

        view = new viewClass(params)
        $(this.page_parent_sel).html(view.render().$el)

    # Methods for each route
    home: () ->
        this.go Home

    colors: () ->
        this.go ViewColors

    cars: () ->
        this.go ViewCars

    cars_car: (id) ->
        this.go ViewCarsDetail, id

