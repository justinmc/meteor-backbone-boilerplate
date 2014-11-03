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

    # The container element that pages are swapped in
    container: null
    containerSelector: "#content"

    # The container of the login component
    header: null
    headerSelector: "#header"

    # Google Analytics instance variable
    _gaq: null

    # Constructor
    initialize: () ->
        @container = $(@containerSelector).get(0)
        @header = $(@headerSelector).get(0)

        # Create a component view that renders in the page template, on every page
        Blaze.render(Template.componentHeader, @header);

        # Setup Google Analytics (change UA-XXXXX-X to your own Google Analytics number!)
        `this._gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
        (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src='//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));`

        # Bind a Google Analytics track event to every page change
        @bind 'all', @_trackPageview

    # Methods for each route
    home: () ->
        @.go Template.home

    colors: () ->
        @.go Template.colors

    cars: () ->
        @.go Template.cars

    cars_car: (id) ->
        @.go Template.carsDetail, false, id

    account: () ->
        @go Template.account, true

    # Actually changes the page by creating the view and inserting it
    go: (template, internal, params) ->
        if !template?
            template = Template.home

        # Pages that are "internal" can only be viewed by a logged in user
        me = @
        Deps.autorun () ->
            # If a user tries to visit an internal page, redirect to home
            if internal? and !Meteor.userId()?
                me.go Template.home
                return

        # If all is well, go to the requested page!
        if !internal or Meteor.userId()?
            @render(template)

    # Render the current view
    render: (template) ->
        @container.innerHTML = ''
        Blaze.render(template, @container)

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
    getHref: (el) ->
        if el? and el.hasAttribute("href")
            return el.href
        else if el?
            return @getHref(el.parentElement)

    # Let Google Analytics know that the page has changed
    _trackPageview: ->
        url = Backbone.history.getFragment()
        @_gaq.push(['_trackPageview', "/#{url}"])

