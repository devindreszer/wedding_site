React = require('react/addons')
Router = require('react-router')
$ = require('jquery')

App = require('./components/App')
HomePage = require('./components/HomePage')
OurStoryPage = require('./components/OurStoryPage')
WeddingPage = require('./components/WeddingPage')
ReceptionPage = require('./components/ReceptionPage')
RegistryPage = require('./components/RegistryPage')
PhotosPage = require('./components/PhotosPage')
RsvpPage = require('./components/RsvpPage')

AppRouter =
  getRoutes: ->
    Route = Router.Route
    DefaultRoute = Router.DefaultRoute
    routes = (
      <Route name="app" path="/" handler={App}>
        <DefaultRoute handler={HomePage}/>
        <Route name="our-story" path="our-story" handler={OurStoryPage} />
        <Route name="wedding" path="wedding" handler={WeddingPage} />
        <Route name="reception" path="reception" handler={ReceptionPage} />
        <Route name="registry" path="registry" handler={RegistryPage} />
        <Route name="photos" path="photos" handler={PhotosPage} />
        <Route name="rsvp" path="rsvp" handler={RsvpPage} />
      </Route>
    )

  run: () ->
    routes = @getRoutes()
    Router.run routes, (Handler) ->
      React.render(<Handler />, $('#container')[0])

module.exports = AppRouter
