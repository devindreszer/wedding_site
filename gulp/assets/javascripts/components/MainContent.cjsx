React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

HomePage = require('./HomePage')
AccomodationsPage = require('./AccomodationsPage')

MainContent = React.createClass
  render: ->
    switch @props.content
      when 'accomodations' then page = @renderAccomodationsPage()
    classes = classNames
      'active': @props.isActive
    <div id="main-content" className={classes}>
      <HomePage subContentActive={@props.content != 'home'} />
      {page}
    </div>

  renderAccomodationsPage: ->
    <AccomodationsPage />

module.exports = MainContent
