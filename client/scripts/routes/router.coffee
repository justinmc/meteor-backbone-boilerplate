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

    # The current view
    view: null
    
    # Selector for the div that will contain each page
    page_parent_sel: "#content"

    # Selector for the container of the login component
    page_header_sel: "#header"

    # Constructor
    initialize: () ->
        # Create a component view that renders in the page template, on every page
        @viewHeader = new ViewHeader()
        $(@page_header_sel).replaceWith(@viewHeader.render().$el)

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
            @view = new viewClass(params)
            @render()

    # Render the current view
    render: () ->
        $(@page_parent_sel).html(@view.render().$el)

    # Method to replace an anchor tag event with a Backbone route event
    aReplace: (e) ->
        # Don't let the page reload like normal
        e.preventDefault()

        # Parse out the part of the url the router needs
        a = document.createElement("a")
        a.href = @getHref(e.target)
        route = a.pathname + a.search

        # Route using the Backbone router without a page refresh
        @navigate(route, {trigger: true})

        # Scroll to the top of the new page
        window.scrollTo(0,0)

    # Gets the href attribute from an element, or if null, from the element's first parent that has the attribute
    getHref: (elt) ->
        if elt.hasAttribute("href")
            return elt.href
        else
            return @getHref(elt.parentElement)

