# Meteor Backbone Boilerplate

<table>
    <tr>
        <td>
            Technologies
        </td>
        <td>
            <a href="http://www.meteor.com">Meteor</a> 1.0, <a href="http://www.backbonejs.org">Backbone</a>, and <a href="http://www.html5boilerplate.com/">HTML5 Boilerplate</a>
        </td>
    </tr>
    <tr>
        <td>
            Meteor Packages Used
        </td>
        <td>
            meteor-platform, accounts-ui, accounts-password, backbone, coffescript
        </td>
    </tr>
    <tr>
        <td>
            Live Demo
        </td>
        <td>
            <a href="http://backbone-boilerplate.meteor.com/">backbone-boilerplate.meteor.com</a>
        </td>
    </tr>
</table>

This project aims to create a starting point for Meteor projects that want to use a Backbone paging system.  A Backbone router is used to swap page templates in and out of a container div.  Everything works reactively with Meteor's data binding.

## Features

Besides integrating with Backbone's router, this project also integrates with Meteor's accounts system.  You can add permissions to routes so that only logged in users can access them, or add a private admin page for developers.

You are also not limited to one template per page, so if you have a navbar or a custom login system that needs to be rendered reactively, as well as the main page itself, this project will handle eveything easily.

All of these features are demostrated in the demo, so check it out live at <a href="http://backbone-boilerplate.meteor.com/">backbone-boilerplate.meteor.com</a> or dive into the code to see how it all works.

### Google Analytics

Google Analytics support is also built in and ready to go, courtesy of [this airbnb blog post](http://nerds.airbnb.com/how-to-add-google-analytics-page-tracking-to-57536/).  Checkout the Backbone router at `client/scripts/routes/router.coffee` to see the implementation and enter your Analytics code.

## Usage

Just clone the repository, run `meteor` in the root directory, and start hacking in your own project like normal.  All that's provided is a starting point for your projects and a basic demo.

