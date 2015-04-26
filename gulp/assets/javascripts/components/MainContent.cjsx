React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

HomePage = require('./HomePage')
AccomodationsPage = require('./AccomodationsPage')
ActivitiesPage = require('./ActivitiesPage')

MainContent = React.createClass
  render: ->
    switch @props.content
      when 'accomodations' then page = @renderAccomodationsPage()
      when 'activities' then page = @renderActivitiesPage()
    classes = classNames
      'active': @props.isActive
    <div id="main-content" className={classes}>
      <HomePage subContentActive={@props.content != 'home'} />
      {page}
    </div>

  renderAccomodationsPage: ->
    <AccomodationsPage />

  renderActivitiesPage: ->
    <ActivitiesPage />

module.exports = MainContent
